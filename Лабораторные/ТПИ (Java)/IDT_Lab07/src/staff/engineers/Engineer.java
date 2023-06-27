package staff.engineers;

import staff.Skills;
import staff.Staff;

public class Engineer extends Staff {
    public Engineer(String skill, double salary) {
        switch (skill) {
            case "AWFUL" -> {
                this.skill = Skills.AWFUL;
            }
            case "UNDER_INTERMEDIATE" -> {
                this.skill = Skills.UNDER_INTERMEDIATE;
            }
            case "INTERMEDIATE" -> {
                this.skill = Skills.INTERMEDIATE;
            }
            case "UPPER_INTERMEDIATE" -> {
                this.skill = Skills.UPPER_INTERMEDIATE;
            }
            case "IMPROVED" -> {
                this.skill = Skills.IMPROVED;
            }
            case "SUPERIOR" -> {
                this.skill = Skills.SUPERIOR;
            }
            default -> {
                this.skill = Skills.ADVANCED;
            }
        }
        this.salary = salary;
    }

}
