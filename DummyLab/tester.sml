
structure Tester =
struct
  open StudentTestSuite

  type 'a sequence  = 'a ArraySequence.seq
  
  val tests = Tests.tests

  (* * * stringifier * * *)
  structure InElt = MkOptionElt (structure Elt = IntElt)

  val stringifier = Logger.create (InElt.toString, IntElt.toString)

  (* * * running the tests * * *)
  fun testZero () =
    let
      val checker = Checker.fromRefsol (StuSol.const,
                                        RefSol.const,
                                        IntElt.equal)
    in
      Tester.testGroup checker stringifier tests
    end

end
