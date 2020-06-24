// RichTextRenderer

import Contentful

/// Renderer for a `Contentful.BlockQuote` node.
open class BlockQuoteRenderer: NodeRendering {
    public typealias NodeType = BlockQuote

    public func render(
        node: BlockQuote,
        rootRenderer: RichTextDocumentRendering,
        context: [CodingUserInfoKey : Any]
    ) -> [NSMutableAttributedString] {
        let contentNodes = node.content.compactMap { $0 as? RenderableNodeProviding }
        let result = contentNodes.reduce(into: [NSMutableAttributedString()]) { result, contentNode in
            let renderedNode = rootRenderer.render(
                node: contentNode,
                context: context
            )
            result.append(contentsOf: renderedNode)

        }.reduce(into: NSMutableAttributedString()) { result, child in
            result.append(child)
        }

        result.addAttributes(
            [.block: true],
            range: NSRange(location: 0, length: result.length)
        )

        var rendered = [result]
        rendered.applyListItemStylingIfNecessary(node: node, context: context)
        rendered.appendNewlineIfNecessary(node: node)
        return rendered
    }
}
