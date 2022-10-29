using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query;
using Microsoft.EntityFrameworkCore.Storage;

namespace ShoeStore.DataAccess.Repository.IRepository;

public interface IRepository<T> where T : class
{
    Task<List<T>> GetAllAsync(Expression<Func<T, bool>>? filter = null,
        bool disableTracking = true,
        Expression<Func<T, object>>? orderBy = null,
        Func<IQueryable<T>, IIncludableQueryable<T, object>>? include = null, int take = -1);
    // Task<List<T>> GetAllAsync(Expression<Func<T, bool>>? filter = null,
    //     bool disableTracking = true,
    //     Func<IQueryable<T>, IOrderedQueryable<T>>? orderBy = null,
    //     Func<IQueryable<T>, IIncludableQueryable<T, object>>? include = null);

    Task AddAsync(T entity);
    void Remove(T entity);
    void RemoveRange(IEnumerable<T> entities);
    void UpdateRange(IEnumerable<T> entities);

    /// <summary>
    /// Gets the first or default entity based on a predicate, orderby delegate and include delegate. This method default no-tracking query.
    /// </summary>
    /// <param name="filter">A function to test each element for a condition.</param>
    /// <param name="orderBy">A function to order elements.</param>
    /// <param name="include">A function to include navigation properties</param>
    /// <param name="disableTracking"><c>True</c> to disable changing tracking; otherwise, <c>false</c>. Default to <c>true</c>.</param>
    /// <returns>An <see cref="IPagedList{T}"/> that contains elements that satisfy the condition specified by <paramref name="filter"/>.</returns>
    /// <remarks>This method default no-tracking query.</remarks>
    Task<T?> FirstOrDefaultAsync(
        Expression<Func<T, bool>>? filter = null,
        bool disableTracking = true,
        Func<IQueryable<T>, IOrderedQueryable<T>>? orderBy = null,
        Func<IQueryable<T>, IIncludableQueryable<T, object>>? include = null);

    // public Task<TResult?> GetFirstOrDefaultAsync<TResult>(Expression<Func<T, TResult>> selector,
    //     Expression<Func<T, bool>> predicate = null,
    //     Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null,
    //     Func<IQueryable<T>, IIncludableQueryable<T, object>> include = null,
    //     bool disableTracking = true);

    bool Any(Expression<Func<T, bool>>? filter);
}