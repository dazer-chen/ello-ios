////
///  UIViewExtensionsSpec.swift
//

@testable import Ello
import Quick
import Nimble


class UIViewSpec: QuickSpec {
    override func spec() {
        describe("UIView") {

            describe("findSubview()") {
                it("finds correct type without passing a test paramater") {
                    let parent = UIView()
                    let child = UITextField()

                    parent.addSubview(child)
                    showView(parent)

                    let found: UITextField? = parent.findSubview()
                    expect(found) == child
                }

                it("finds correct type with passing a test paramater") {
                    let child = UIView()
                    let parent = UITextField()
                    let nestedChild = UITextField()
                    nestedChild.text = "Hi, I am nested"

                    child.addSubview(nestedChild)
                    parent.addSubview(child)
                    showView(parent)

                    let found: UITextField? = parent.findSubview { textView in
                        return textView.text == "Hi, I am nested"
                    }

                    expect(found) == nestedChild
                }
            }

            describe("findParentView(_:)") {

                it("finds correct type without passing a test paramater") {
                    let child = UIView()
                    let parent = UITextField()

                    parent.addSubview(child)
                    showView(parent)

                    let found: UITextField? = child.findParentView()
                    expect(found!).to(equal(parent))
                }

                it("finds correct type with passing a test paramater") {
                    let child = UIView()
                    let parent = UITextField()
                    let superParent = UITextField()
                    superParent.text = "Hi, I am super"

                    superParent.addSubview(parent)
                    parent.addSubview(child)
                    showView(superParent)

                    let found: UITextField? = child.findParentView { textView in
                        return textView.text == "Hi, I am super"
                    }

                    expect(found!).to(equal(superParent))
                }
            }
        }
    }
}
