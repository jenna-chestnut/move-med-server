const CommentsService = {
  getComment(db, id) {
    return db
      .from('comments')
      .where({ id })
      .then(([comment]) => comment);
  },
  getAllComments(db, user_exercise_id) {
    return db
      .from('comments')
      .where({ user_exercise_id });
  },
  createComment(db, newComment) {
    return db
      .insert(newComment)
      .into('comments')
      .returning('*')
      .then(([comment]) => comment);
  },
  updateComment(db, id, data) {
    return db
      .from('comments')
      .update(data)
      .where({ id })
      .returning('*')
      .then(([comment]) => comment);
  },
  deleteComment(db, id) {
    return db
      .from('comments')
      .where({ id })
      .delete();
  }
};

module.exports = CommentsService;