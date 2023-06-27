import {ActionFilter, Actions, Busyness, Experience, Field, Filter, Schedule} from "../actions";
import {FormEvent, useState} from "react";
import {JSX} from "react";
import s from "./../styles/SearchBar.module.scss"
import {
    Box,
    Button,
    FormControl,
    FormControlLabel,
    Radio,
    RadioGroup,
    TextField
} from "@mui/material";

import arrowIcon from "./../images/arrow.png"
import scheduleIcon from "./../images/schedule.png"
import busynessIcon from "./../images/busyness.png"
import starIcon from "./../images/star.png"
import salaryIcon from "./../images/salary.png"

type SearchBarComponentProp = {
    stateOfFilter: Filter,
    handleAction: ActionFilter
}
type TSearchBarComponent = (prop: SearchBarComponentProp) => JSX.Element

export const SearchBarComponent: TSearchBarComponent = ({stateOfFilter, handleAction}) => {

    let [showScheduleRadioButtons, setScheduleRadioButtonsVisibility] = useState(false);
    let [showBusynessRadioButtons, setBusynessRadioButtonsVisibility] = useState(false);
    let [showExperienceRadioButtons, setExperienceRadioButtonsVisibility] = useState(false);

    const SetFilter = (field: Field, value: FieldValue) => {

        switch (field) {
            case (Field.Schedule): {
                setScheduleRadioButtonsVisibility(false);
                break;
            }
            case (Field.Busyness): {
                setBusynessRadioButtonsVisibility(false);
                break;
            }
            case (Field.Experience): {
                setExperienceRadioButtonsVisibility(false);
                break;
            }
            default: break;
        }

        handleAction({
            type: Actions.SET_FILTER,
            payload: {
                field: field,
                value: value
            }
        })
    }
    const ShowRadioButtons = (field: Field) => {
        switch (field) {
            case (Field.Schedule): {
                setScheduleRadioButtonsVisibility(true);
                break;
            }
            case (Field.Busyness): {
                setBusynessRadioButtonsVisibility(true);
                break;
            }
            case (Field.Experience): {
                setExperienceRadioButtonsVisibility(true);
                break;
            }
            default: break;
        }
    }

    return(<Box className={s.bar}>
        <form className={s.desktopForm}>

            <Box className={s.inputsWrapper}>
                <Box className={s.location}>
                    <img src={arrowIcon}/>
                    <TextField variant="outlined" className={s.textInput} value={stateOfFilter.location} onInput={(event: FormEvent<HTMLInputElement>) => {
                        SetFilter(Field.Location, event.target.value);
                    }}/>
                </Box>

                <Box className={s.schedule} onClick={() => ShowRadioButtons(Field.Schedule)}>
                    <img src={scheduleIcon}/>
                    <Box>{stateOfFilter.schedule}</Box>

                    {showScheduleRadioButtons ? <Box className={s.radioButtons} id={"scheduleRadioButtons"}>
                        <FormControl>
                            <RadioGroup>
                                {Object.values(Schedule).map(t => <FormControlLabel key={t} value={t} label={t} id={t} control={<Radio/>} name={"Schedule"} checked={stateOfFilter.schedule === t} onChange={() => SetFilter(Field.Schedule, t)}/>)}
                            </RadioGroup>
                        </FormControl>
                    </Box> : <Box/>}
                </Box>

                <Box className={s.busyness} onClick={() => ShowRadioButtons(Field.Busyness)}>
                    <img src={busynessIcon}/>
                    <Box>{stateOfFilter.busyness}</Box>

                    {showBusynessRadioButtons ? <Box className={s.radioButtons} id={"busynessRadioButtons"}>
                        <FormControl>
                            <RadioGroup>
                                {Object.values(Busyness).map(t => <FormControlLabel key={t} value={t} label={t} id={t} control={<Radio/>} name={"Busyness"} checked={stateOfFilter.busyness === t} onChange={() => SetFilter(Field.Busyness, t)}/>)}
                            </RadioGroup>
                        </FormControl>
                    </Box> : <Box/>}
                </Box>

                <Box className={s.experience} onClick={() => ShowRadioButtons(Field.Experience)}>
                    <img src={starIcon}/>
                    <Box>{stateOfFilter.experience}</Box>

                    {showExperienceRadioButtons ? <Box className={s.radioButtons} id={"experienceRadioButtons"}>
                        <FormControl>
                            <RadioGroup>
                                {Object.values(Experience).map(t => <FormControlLabel key={t} value={t} label={t} id={t} control={<Radio/>} name={"Experience"} checked={stateOfFilter.experience === t} onChange={() => SetFilter(Field.Experience, t)}/>)}
                            </RadioGroup>
                        </FormControl>
                    </Box> : <Box/>}
                </Box>

                <Box className={s.salary}>
                    <img src={salaryIcon}/>
                    <TextField variant="outlined" type="number" className={s.textInput} value={stateOfFilter.salary} onInput={(event) => {
                        SetFilter(Field.Salary, event.target.value);
                    }}/>
                </Box>
            </Box>

            <Box className={s.submitButton}>
                <Button onClick={(event: MouseEvent<HTMLButtonElement>) => {
                    event.preventDefault();
                    handleAction({type: Actions.APPLY_FILTER, payload: stateOfFilter});
                }}>Поиск</Button>
            </Box>

        </form>
    </Box>)
}