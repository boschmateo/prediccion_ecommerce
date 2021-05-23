import pandas as pd
import pickle

def classify(file_path, out_path):

    def decide_group(row):
        if row["prob_1"] < 0.4:
            return "Muy baja"
        if row["prob_2"] >= 0.5:
            return "Muy alta"
        elif row["prob_2"] >= 0.3 and row["prob_2"] < 0.5:
            return "Media"
        else:
            return "Baja"
    
    num_cols = ["ipcasos", "visit_days", "visits_per_day", "fichas_basicas", "perfil_promocional",  "bonad_email"]
    df = pd.read_csv(file_path, dtype=int)


    scaler = pickle.load(open("./models/pickle_scaler.pkl",'rb'))
    model1 = pickle.load(open("./models/pickle_rf.pkl",'rb'))
    model2 = pickle.load(open("./models/pickle_2nd_rf.pkl",'rb'))
    df_t = pd.DataFrame(scaler.transform(df[num_cols]), columns=num_cols)
    df_t["same_section"] = df[["same_section"]].apply(test, axis=1)
    df_t["same_division"] = df.apply(lambda row: 1 if row["same_division"] >= 1 else 0, axis=1)
    df_t["same_group"] = df.apply(lambda row: 1 if row["same_group"] >= 1 else 0, axis=1)
    df_t["same_class"] = df.apply(lambda row: 1 if row["same_class"] >= 1 else 0, axis=1)

    df_t["prob_1"] = list(map(lambda x: x[1], model1.predict_proba(df_t)))
    df_t["prob_2"] = list(map(lambda x: x[1], model2.predict_proba(df_t[df.columns])))

    df_t["group"] = df_t.apply(decide_group, axis=1)
    df_t.to_csv(out_path, index=False)



classify("./test.csv", "./out.csv")



