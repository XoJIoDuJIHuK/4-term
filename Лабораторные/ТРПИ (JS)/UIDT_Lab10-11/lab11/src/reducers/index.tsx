import jobs from "./jobs";
import visibilityFilter from "./visibilityFilter";
import displayedJob from "./displayedJob";
import stateOfFilter from "./stateOfFilter";
import stateOfJobsList from "./stateOfJobsList";
import { combineReducers } from 'redux';

export default combineReducers({
    allJobs: jobs,
    visibilityFilter: visibilityFilter,
    displayedJob: displayedJob,
    stateOfJobsList: stateOfJobsList,
});