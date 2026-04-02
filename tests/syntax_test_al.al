// SYNTAX TEST "Packages/AL/AL.sublime-syntax"

namespace MyCompany.MyApp;
// ^^^^^^^ keyword.import.al

using System.Text;
// ^^^ keyword.import.al

codeunit 50000 "My Codeunit" implements IFace
// ^^^^^ storage.type.al
//       ^^^^^ constant.numeric.integer.al
//             ^^^^^^^^^^^^^^ entity.name.type.al
//                            ^^^^^^^^^^ keyword.import.al
{
    var
//  ^^^ keyword.declaration.al
        MyVar: Integer;
//      ^^^^^ variable.other.al
//             ^^^^^^^ support.type.al

    [Scope('OnPrem')]
//   ^^^^^ variable.annotation.al
//         ^^^^^^^^ string.quoted.single.al

    local procedure MyMethod(var Param: Record "Customer"): Boolean
//  ^^^^^ storage.modifier.al
//        ^^^^^^^^^ keyword.declaration.al
//                  ^^^^^^^^ entity.name.function.al
//                           ^^^ storage.modifier.al
//                               ^^^^^ variable.parameter.al
//                                      ^^^^^^ support.type.al
//                                             ^^^^^^^^^^ entity.name.type.al
//                                                         ^^^^^^^ support.type.al
    var
        x: Integer;
    begin
//  ^^^^^ keyword.control.al
        if x > 0 then
//      ^^ keyword.control.al
//             ^ keyword.operator.comparison.al
//               ^^^^ keyword.control.al
            x := x + 1;
//            ^^ keyword.operator.assignment.al
//                 ^ keyword.operator.arithmetic.al
        MyVar := 'hello';
//               ^^^^^^^ string.quoted.single.al
        exit(true);
//      ^^^^ keyword.control.al
//           ^^^^ constant.language.al
    end;
//  ^^^ keyword.control.al
}

table 50000 "My Table"
// ^^ storage.type.al
{
    fields
//  ^^^^^^ keyword.other.al
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Number';
//                    ^^^^^^^^ string.quoted.single.al
        }
    }
}

// Preprocessor
#if not CLEAN25
// <- punctuation.definition.directive.al
// ^^ keyword.control.import.al
//    ^^^ keyword.operator.al
//        ^^^^^^^ variable.other.al
#else
// <- punctuation.definition.directive.al
// ^^^ keyword.control.import.al
#endif
// <- punctuation.definition.directive.al
// ^^^^ keyword.control.import.al

#pragma warning disable AL0432
// <- punctuation.definition.directive.al
// ^^^^^ keyword.control.import.al

/* block comment */
// ^^^^^^^^^^^^^ comment.block.al

// line comment
// <- comment.line.double-slash.al
