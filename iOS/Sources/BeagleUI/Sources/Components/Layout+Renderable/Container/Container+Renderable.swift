/*
 * Copyright 2020 ZUP IT SERVICOS EM TECNOLOGIA E INOVACAO SA
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIKit
import BeagleSchema

// MARK: - Configuration
extension Container {
    
    public func applyFlex(_ flex: Flex) -> Container {
        let style = (widgetProperties.style ?? Style()).flex(flex)
        return Container(
            children: children,
            widgetProperties: .init(
                id: widgetProperties.id,
                style: style,
                accessibility: widgetProperties.accessibility
            ),
            context: _context_
        )
    }
}

extension Container: ServerDrivenComponent {

    public func toView(renderer: BeagleRenderer) -> UIView {
        let containerView = UIView()

        children.forEach {
            let view = renderer.render($0)
            containerView.addSubview(view)
        }
        
        return containerView
    }
}