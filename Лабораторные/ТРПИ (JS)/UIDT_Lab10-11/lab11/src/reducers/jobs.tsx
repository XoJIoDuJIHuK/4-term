import {JobsData} from "../Jobs"
import {Actions} from "../actions";

type JobsInteractionAction = {
    type: Actions,
    payload: number
}
type JobsReducer = (allJobs: Job[], action: JobsInteractionAction) => Job[]

const jobs: JobsReducer = (allJobs = JobsData, action) => {
    switch (action.type) {
        case Actions.TOGGLE_IS_FAVOURITE:
        {
            return allJobs.map(u => {
                if (u.id === action.payload) {
                    u.isFavourite = !u.isFavourite;
                }
                return u;
            });
        }
        case Actions.SELECT_JOB:
        {
            return allJobs.map(u => {
                u.isSelected = u.id === action.payload;
                return u;
            });
        }
        case Actions.UNSELECT_JOB:
        {
            return allJobs.map(u => {
                u.isSelected = false;
                return u;
            });
        }
        default:
            return allJobs;
    }
}

export default jobs;