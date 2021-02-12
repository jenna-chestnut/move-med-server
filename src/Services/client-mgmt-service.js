const ClientMgmtService = {
  // FOR USER EXERCISES
  getUserExercise(db, id, user_id, mgmt) {
    return mgmt
      ? 
      db
        .from('user_exercises')
        .innerJoin('exercises', 'exercises.id', 'user_exercises.exercise_id')
        .select('user_exercises.*', 'exercises.exercise_name', 'exercises.videourl', 'exercises.imgurl')
        .where({ 'user_exercises.id' : id })
        .first()
      :
      db
        .from('user_exercises')
        .innerJoin('exercises', 'exercises.id', 'user_exercises.exercise_id')
        .select('user_exercises.*', 'exercises.exercise_name', 'exercises.videourl', 'exercises.imgurl')
        .where({ exercise_id: id, user_id })
        .first();
  },
  getAllUserExercises(db, user_id) {
    return db
      .from('user_exercises')
      .innerJoin('exercises', 'exercises.id', 'user_exercises.exercise_id')
      .select('user_exercises.*', 'exercises.exercise_name', 'exercises.videourl', 'exercises.imgurl')
      .where({ 'user_exercises.user_id' : user_id });
  },
  createUserExercise(db, data) {
    return db
      .insert(data)
      .into('user_exercises')
      .returning('*')
      .then(([exercise]) => exercise);
  },
  updateUserExercise(db, id, data) {
    return db
      .from('user_exercises')
      .update(data)
      .where({ id })
      .returning('*')
      .then(([exercise]) => exercise);
  },
  deleteUserExercise(db, id) {
    return db
      .from('user_exercises')
      .where({ id })
      .delete();
  },

  // FOR USER GOAL 
  getUserGoal(db, user_id) {
    return db
      .from('user_goal')
      .where({ user_id })
      .then(([goal]) => goal);;
  },
  createUserGoal(db, data) {
    return db
      .insert(data)
      .into('user_goal')
      .returning('*')
      .then(([goal]) => goal);
  },
  updateUserGoal(db, user_id, data) {
    return db
      .from('user_goal')
      .update(data)
      .where({ user_id })
      .returning('*')
      .then(([goal]) => goal);
  }
};

module.exports = ClientMgmtService;