platform :ios, '13.0'

workspace 'RichTextRenderer.xcworkspace'

target 'RichTextRenderer' do
    pod 'AlamofireImage'
    pod 'Contentful'
end

target 'Example-iOS' do
  project 'Example-iOS/Example-iOS.xcodeproj'
  pod 'Contentful'
  pod 'ContentfulRichTextRenderer', :path => 'ContentfulRichTextRenderer.podspec'
end
