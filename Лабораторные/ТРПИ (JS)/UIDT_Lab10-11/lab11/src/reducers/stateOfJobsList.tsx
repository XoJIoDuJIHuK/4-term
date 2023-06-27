import {Busyness, Experience, Filter, Actions, Schedule, Field} from "../actions";

type ApplyFilterAction = {
    type: Actions,
    payload: Filter
}
type StateOfJobsListReducer = (state: Filter, action: ApplyFilterAction) => Filter

const stateOfJobsList: StateOfJobsListReducer = (state = {
    location: "Москва",
    schedule: Schedule.FULL_DAY,
    busyness: Busyness.FULL,
    experience: Experience.FIRST,
    salary: 20000000,
    selectedTag: undefined,
}, action) => {
    switch (action.type) {
        case Actions.SET_FILTER:
        {
            switch (action.payload.field) {
                case (Field.Location): {
                    return {
                        ...state,
                        location: action.payload.value !== "" ? (action.payload.value ) : "Москва"
                    }
                }
                case (Field.Schedule): {
                    return {
                        ...state,
                        schedule: action.payload.value
                    }
                }
                case (Field.Busyness): {
                    return {
                        ...state,
                        busyness: action.payload.value
                    }
                }
                case (Field.Experience): {
                    return {
                        ...state,
                        experience: action.payload.value
                    }
                }
                case (Field.Tag): {
                    return {
                        ...state,
                        selectedTag: action.payload.value === state.selectedTag ? undefined : action.payload.value
                    }
                }
                default: {
                    return {
                        ...state,
                        salary: action.payload.value !== "" ? action.payload.value : "0"
                    }
                }
            }
        }
        default: {
            return state;
        }
    }
};

export default stateOfJobsList;