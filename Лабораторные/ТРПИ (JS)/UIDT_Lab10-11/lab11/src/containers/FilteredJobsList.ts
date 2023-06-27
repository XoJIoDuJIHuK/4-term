import {SearchJobsComponent} from "../components/SearchJobsComponent";
import {connect} from "react-redux";
import {Dispatch, Filter, selectJob, setSelectedTag, State, toggleIsFavourite, VisibilityFilters} from "../actions";
import {Tags} from "../Jobs";

const getFilteredJobs: Job[] = (jobs: Job[], showFavourites: boolean, stateOfJobsList: Filter) => {
    let filteredJobs = jobs.filter(job => ((job.location === stateOfJobsList.location) && (job.schedule === stateOfJobsList.schedule)
        && (job.busyness === stateOfJobsList.busyness) && (job.experience === stateOfJobsList.experience) &&
        (!job.minSalary || job.minSalary <= stateOfJobsList.salary) &&
        (!job.maxSalary || job.maxSalary >= stateOfJobsList.salary) &&
        (!stateOfJobsList.selectedTag || job.tags.includes(stateOfJobsList.selectedTag))))
    if (showFavourites) {
        return filteredJobs.filter(t => t.isFavourite)
    }
    else {
        return filteredJobs
    }
}

const mapStateToProps = (state: State) => ({
    allJobs: getFilteredJobs(state.allJobs, state.showFavourites, state.stateOfJobsList),
    showFavourites: state.visibilityFilter !== VisibilityFilters.SHOW_ALL,
});

const mapDispatchToProps = (dispatch: Dispatch) => {
    return ({
        handleFavouriteButtonClick: (id: number) => {
            dispatch(toggleIsFavourite(id));
        },
        handleSelect: (id: number) => {
            dispatch(selectJob(id));
        },
        handleTagSelect: (tag: Tags) => {
            dispatch(setSelectedTag(tag));
        }
    });
};

export default connect(mapStateToProps, mapDispatchToProps)(SearchJobsComponent)