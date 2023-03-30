using Microsoft.EntityFrameworkCore;

namespace JobOpenings.Services.Repository
{
    public class Repository<T> : IRepository<T> where T : class
    {
        private readonly DbContext _Context;
        DbSet<T> dbSet;
        public Repository(DbContext context)
        {
            _Context = context;
            dbSet = context.Set<T>();
            //queries = _Context.Query<T>();
        }
        public virtual T GetById(object Id)
        {
            return dbSet.Find(Id);
        }
        public IQueryable<T> GetAll()
        {
            return dbSet;
        }
        public T Add(T model)
        {
            dbSet.Add(model);
            _Context.SaveChanges();
            return model;
        }
        public void Modify(T model)
        {
            _Context.Entry(model).State = EntityState.Modified;
            _Context.SaveChanges();
        }
    }
}
