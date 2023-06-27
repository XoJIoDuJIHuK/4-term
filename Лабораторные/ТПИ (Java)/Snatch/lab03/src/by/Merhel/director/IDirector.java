package by.Merhel.director;

import by.Merhel.TVProgram.ProgramList;
import by.Merhel.program.BasicProgram;
import by.Merhel.program.type;

public interface IDirector {
    public BasicProgram getLongestPr(ProgramList list);
    public BasicProgram getTypePr(ProgramList list, type t);
    public int getAllLength(ProgramList list);

    public void sortByDuration(ProgramList list);
}
