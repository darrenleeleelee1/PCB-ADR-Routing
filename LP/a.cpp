#include <ctime>
#include <ilcplex/ilocplex.h>
ILOSTLBEGIN

void test(IloEnv &env, IloModel &model, IloNumVarArray &x)
{
    IloNumExprArray xoffset(env);
    x.add(IloNumVar(env, 0, IloInfinity, ILOINT));
    x.add(IloNumVar(env, 0, IloInfinity, ILOINT)); // default: between $0$ and $+\infty$
    xoffset.add(IloIfThen(env, x[0] >= 0, 12 * x[0] + 4 * x[1] >= 50));
    xoffset.add(IloIfThen(env, x[0] >= 0, 6 * x[0] + 5 * x[1] >= 40));
    model.add(xoffset);
    model.add(IloMinimize(env, 6000 * (x[0]) + 4000 * x[1]));
}
void t(IloEnv &env, IloModel &model, IloNumVarArray &x, int n)
{
    IloNumVarArray xoffset(env);
    int numOfTerminals = n;
    int boundary = 1000000;
    int terminalSpace = 100, terminalHeight = 100, terminalWidth = 100;
    int a = 8, b = 15, c = 8, d = 15;
    for (int i = 0; i < numOfTerminals; i++)
    {
        xoffset.add(IloNumVar(env));
        x.add(IloNumVar(
            env, max(0, (a + 6 * i) - 2 * terminalSpace), min(boundary, (b + 6 * i) + 2 * terminalSpace), ILOINT));
    }
    for (int i = 0; i < numOfTerminals; i++)
    {
        for (int j = i + 1; j < numOfTerminals; j++)
        {
            model.add(IloAbs(x[i] - x[j]) >= (terminalSpace + terminalHeight));
        }
    }
    for (int i = 0; i < numOfTerminals; i++)
    {
        model.add(IloIfThen(env, x[i] < a + 6 * i, (xoffset[i] == a + 6 * i - x[i])));
        model.add(IloIfThen(env, x[i] > b + 6 * i, (xoffset[i] == x[i] - b + 6 * i)));
    }
    model.add(IloMinimize(env, IloSum(xoffset)));
}
void testnew(IloEnv &env, IloModel &model, IloNumVarArray &x)
{
    // IloNumExprArray xoffset(env, 2);
    IloNumVarArray xoffset(env);
    xoffset.add(IloNumVar(env));
    xoffset.add(IloNumVar(env));
    x.add(IloNumVar(env, 0, 30, ILOINT));
    x.add(IloNumVar(env, 0, 30, ILOINT));
    int a = 8, b = 15, c = 8, d = 15;
    // xoffset[0] = IloAbs((x[0] - a) + (x[0] - b)) / 2 - (b - a);
    // xoffset[1] = IloAbs((x[1] - c) + (x[1] - d)) / 2 - (d - c);
    model.add(x[0] - x[1] >= 13);
    IloNumVar tmp(env), tmp1(env);
    model.add(IloAbs(x[0] - x[1]) >= 13);
    model.add(IloIfThen(env, x[0] < a, (xoffset[0] == a - x[0])));
    model.add(IloIfThen(env, x[0] > b, (xoffset[0] == x[0] - b)));
    // xoffset[0] = tmp;
    model.add(IloIfThen(env, x[1] < c, (xoffset[1] == c - x[1])));
    model.add(IloIfThen(env, x[1] > d, (xoffset[1] == x[1] - d)));
    // xoffset[1] = tmp1;
    model.add(IloMinimize(env, IloSum(xoffset)));
}
int repeat(int n)
{
    IloEnv env;
    try
    {
        IloModel model(env);
        IloNumVarArray x(env);
        IloNumArray v(env);
        t(env, model, x, n);
        // testnew(env, model, x);
        // x.end();
        IloCplex cplex(model);
        /* get the log out */
        cplex.setOut(env.getNullStream());
        cplex.setError(env.getNullStream());
        /* get the log out */
        cplex.solve();
        cout << "Min= " << cplex.getObjValue() << endl;
        cplex.getValues(v, x);
        cout << "Vars " << v << endl;
        // cplex.exportModel("placement.lp");
    }
    catch (IloException &e)
    {
        cerr << "Concert exception caught: " << e << endl;
    }
    catch (...)
    {
        cerr << "Unknown exception caught" << endl;
    }
    env.end();
}

int main()
{
    clock_t a;

    for (int i = 1; i <= 100; i++)
    {
        cout << "-----------#" << i << "-----------" << endl;
        a = clock();
        IloEnv env;
        try
        {
            IloModel model(env);
            IloNumVarArray x(env);
            IloNumArray v(env);
            t(env, model, x, i);
            // testnew(env, model, x);
            // x.end();
            IloCplex cplex(model);
            /* get the log out */
            cplex.setOut(env.getNullStream());
            cplex.setError(env.getNullStream());
            /* get the log out */
            cplex.solve();
            cout << "Min= " << cplex.getObjValue() << endl;
            cplex.getValues(v, x);
            cout << "Vars " << v << endl;
            // cplex.exportModel("placement.lp");
        }
        catch (IloException &e)
        {
            cerr << "Concert exception caught: " << e << endl;
        }
        catch (...)
        {
            cerr << "Unknown exception caught" << endl;
        }
        env.end();

        a = clock() - a;
        cout << "-----------clock:" << double(a) / CLOCKS_PER_SEC << "-----------" << endl;
    }
}
