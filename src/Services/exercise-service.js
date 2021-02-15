const ExerciseService = {
  // FOR BASE EXERCISES
  getAllExercises(db) {
    return db
      .from('exercise_body_parts')
      .fullOuterJoin('exercises', 'exercises.id', 'exercise_body_parts.exercise_id')
      .fullOuterJoin('body_categories', 'body_categories.id', 'exercise_body_parts.body_category_id')
      .select('exercises.*', 'body_categories.body_part');
  },
  getExercise(db, id) {
    return db
      .from('exercises')
      .where({ id })
      .first();
  },
  updateExercise(db, id, data) {
    return db
      .from('exercises')
      .update(data)
      .where({ id })
      .returning('*')
      .then(([exercise]) => exercise);
  },
  createExercise(db, newExercise) {
    return db
      .insert(newExercise)
      .into('exercises')
      .returning('*')
      .then(([exercise]) => exercise);
  },
  deleteExercise(db, id) {
    return db
      .from('exercises')
      .where({ id })
      .delete();
  }
};

module.exports = ExerciseService;