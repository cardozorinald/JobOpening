using System.Linq.Expressions;

namespace JobOpenings.Services.Repository
{
    public interface IRepository<T> where T : class
    {
        T Add(T model);
        T GetById(object Id);
        void Modify(T model);
        IQueryable<T> GetAll();
    }
}
