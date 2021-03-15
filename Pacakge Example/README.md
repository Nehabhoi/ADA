### Ada Packages 
1. Packages in Ada are multiple type encapsulation constructs.
2. They can include any number of declarations of both data and subroutines.
3. Packages usually have two parts: Specification package (the interface), Body package (implementation of the entities named in the specification.
4. Every package has a package_specification, but not all packages have a package_body.
5. Spec and Body Consistency <br/>
        Every routine declared in the spec must be defined in the body <br/>
        The signatures in the spec and body must be identical<br/> 
        => Parameter names, types, and order must be identical <br/>
        => Function return types must be identica <br/>
6. Package Lines requires 2 files: <br/>
        Lines.ads: Package Specification - contains the public interface<br/>
        Lines.adb: Package Body - contains the implementation<br/>
7. Lines Package has definitions of:<br/>
    => Record type Point and Line<br/>
    => Functions: Distance and Slope<br/>
    => Procedures: SetLine, PrintLine, PrintPoint<br/>
8. Client of Package Lines is CalcLine<br/>
    =>Notice the with and use of package Lines, Type Line, Procedures SetLine, PrintLine and functions Distance, Slope are defined in package Lines and visible in client<br/>
9. Packages: Normal Compilation (refer "output1.png")<br/>
    => Compiling client will automatically compile client.<br/>
    => gnatmake CalcLine compiles client and package. It will creates following files:<br/>
            =>Lines.ali, Lines.o, CalcLine.ali, CalcLine.o, CalcLine.exe <br/>
            (Assume Lines.adb does not exist (yet), Checks for syntax errors in CalcLine.adb, Checks for that CalcLine.adb is consistent with Lines.ads, Generates CalcLine.ali, Generates CalcLine.o, No executable generated, Syntax error since body not found)
    => The .ali files contain library information about the compile<br/>
    => The .o files contain machine code for the given routine or package, but no code from (other) packages<br/>
    => The link step of gnatmake joins the .o files and creates the executable pairclient.exe<br/>

10. Compiling Package Specs and Bodies Independently (refer "output2.png"<br>
    => Specs and bodies can be checked independently<br/>
    => Checking the spec - gnatmake Lines.ads: (Checks for syntax errors in Lines.ads, Generates Lines.ali, Gives an error message because Line.ads generates no code [Can avoid error message with gnatmake -gnatc Lines.ads])
    => Checking the body - gnatmake Lines.adb (Checks for syntax errors in Lines.adb, Checks for that Lines.adb is consistent with Lines.ads, Generates Lines.ali, Generates Lines.o, No executable generated, Syntax error if spec not available)

### Summary: Ada Package Specification
1. Has two sections: public and private <br/>
    => Public section is everything above keyword private<br/>
    => Private section is everything following keyword private<br/>
2. Public section can define following services:<br/>
    => Names of (private) Types<br/>
    => Procedure and function signatures<br/>
    => Constants<br/>
    => Exceptions<br/>
3. Private section typically contains: <br/>
    => Implementation of private types<br/>
    => Private constants and types<br/>

### Summary: Ada Package Body
1. Must contain an implementation of every procedure and routine defined in specification<br/>
2. Signatures in package and body must match exactly (eg name, mode, type of parameters) <br/>
3. Private section of package specification is visible in package body<br/>
4. Package body is not visible to outside<br/>
5. Package body can contain routines, types, constants, etc that are not defined in the specification. These routines are private to the body.<br/>

### Summary: Ada Package Client
1. The client must have a use clause for any package it refers to<br/>
2. The client can only see the public section of the spec<br/>

