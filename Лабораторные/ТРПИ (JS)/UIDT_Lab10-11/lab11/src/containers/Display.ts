import {Actions, Dispatch, selectJob, toggleIsFavourite, VisibilityFilters} from "../actions";
import {connect} from "react-redux";
import {DisplayComponent} from "../components/DisplayComponent";

type MapProp = {
    allJobs: Job[],
    visibilityFilter: VisibilityFilters
}

const mapStateToProps = (state: MapProp) => {
    return {
        allJobs: state.allJobs,
        visibilityFilter: state.visibilityFilter,
    }
};

const mapDispatchToProps = (dispatch: Dispatch) => ({
    handleCloseClick: () => dispatch({type: Actions.UNSELECT_JOB})
});

export default connect(mapStateToProps, mapDispatchToProps)(DisplayComponent)