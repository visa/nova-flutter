// 
//              © 2025 Visa
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//        http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//
class VNestedCheckboxItem {
  String label;
  List<VNestedCheckboxItem>? children;
  String id;
  VNestedCheckboxItem? parent;
  VNestedCheckboxItem({
    required this.label,
    required this.id,
    List<VNestedCheckboxItem>? children,
  }) : children = children ?? [] {
    for (var child in this.children!) {
      child.parent = this;
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VNestedCheckboxItem && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
