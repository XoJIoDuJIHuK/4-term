package planets;

import java.util.Date;

public class Planets {
    public String Name;
    public int Radius;
    public int AvgTemperature;
    public boolean HaveAtmosphere;
    public boolean HaveLife;

    public Planets(String name, int radius, int avgTemperature, boolean haveAtmosphere, boolean haveLife) {
        Name = name;
        Radius = radius;
        AvgTemperature = avgTemperature;
        HaveAtmosphere = haveAtmosphere;
        HaveLife = haveLife;
    }

    public String getName() {
        return Name;
    }

    public int getRadius() {
        return Radius;
    }

    public int getAvgTemperature() {
        return AvgTemperature;
    }

    public boolean isHaveAtmosphere() {
        return HaveAtmosphere;
    }

    public boolean isHaveLife() {
        return HaveLife;
    }

    public void setName(String name) {
        Name = name;
    }

    public void setRadius(int radius) {
        Radius = radius;
    }

    public void setAvgTemperature(int avgTemperature) {
        AvgTemperature = avgTemperature;
    }

    public void setHaveAtmosphere(boolean haveAtmosphere) {
        HaveAtmosphere = haveAtmosphere;
    }

    public void setHaveLife(boolean haveLife) {
        HaveLife = haveLife;
    }
}