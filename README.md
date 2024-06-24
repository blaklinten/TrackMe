# TrackMe
A time tracker with both CLI(fzf) and DMenu interfaces

 PLEASE READ ALL SOURCE CODE BEFORE USING.

 There might be static refrences to directories causing the script to crash or work incorrectly.

# Setup
Weather you want to use Git or not, you must create "~/.trackme" where your data will live.
To use git, `export TRACKME_GITSYNC=yes`.
Also, `export TRACKME_INTERFACE=fzf|dmenu`

# Testing
There is a collection of tests in the `./test/tests`-folder.

Run `./test_runner.sh` to execute all tests.

# Utils
A collection of scripts to validate the state of the database and help with the development of TrackMe.

## Validate the state of database
Scripts to normalize the contents and validate its state.
A copy of the database must exist in the working directory according to $CLIENTS-variable (currently ./trackmedata).
One way of doing this is to clone the db repo;

```
git clone https://blaklinten@github.com/blaklinten/TrackMeData trackmedata
```

  - clean_up_DB: Make sure all entries follow a normalized format before start the work.

  - create_events_from_DB: Extract a normalized events-like file from the data to work with.

Now we are ready to make changes either in the database or in the eventfile;
  1. If changes are done in the database (./trackmedata), make sure to re-generate the event file after since the validation scripts work on the event file.
  This is not recommended since it would take more time than editing the event file.

  2. Recommended way is to make changes to the event file -> validate changes -> create new db -> update remote with new, improved db.

- validate_duration: Make sure that expected duration ("Duration" field) matches calculated duration. This is to prevent manually added entries having erroneous duration.

- validate_non-overlapping_entries: Make sure no entries overlap. The application does not support simultaneous activities so if any end time is after the next entries' start time we have an error. 
