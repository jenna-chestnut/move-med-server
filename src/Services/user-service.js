const UserService = {
  getAllUsers(db) {
    return db
      .from('users');
  },
  getAllClients(db) {
    return db
      .from('users')
      .where({ is_admin : false, is_provider: false });
  },
  getUser(db, id) {
    return db
      .from('users')
      .where({ id })
      .then(([client]) => client);
  },
  updateUser(db, id, data) {
    return db
      .from('users')
      .update(data)
      .where({ id })
      .returning('*')
      .then(([user]) => user);
  },
  deleteUser(db, id) {
    return db
      .from('users')
      .where({ id })
      .delete();
  }
};

module.exports = UserService;