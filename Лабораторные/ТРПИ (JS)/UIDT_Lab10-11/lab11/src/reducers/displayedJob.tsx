import {Actions} from "../actions";

type SelectJobAction = {
    type: Actions,
    payload: number
}
type IDisplayedJob = (state: number, action: SelectJobAction) => number

const displayedJob: IDisplayedJob = (state = -1, action) => {
    switch (action.type) {
        case Actions.SELECT_JOB: {
            return action.payload;
        }
        default: return state;
    }
}

export default displayedJob;