Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB983A48E9
	for <nova-gpu@lists.linux.dev>; Sat, 29 Aug 2026 01:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787966578; cv=fail; b=FOtNVB3wS7POByl1K76H/80oc/Ekn64o6RT08EvyAO86CUj7US3PEdTqUCl0oliwLb4CyMlidgl+t+8krf0fZSCEFCFjvtn4hQ+ZoGvIg9EJflxC4HTxCeTe64tu5fjr7eNAHMjQakPlrz18G+mznOKICshRNkkJetRhJc2UiqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787966578; c=relaxed/simple;
	bh=X4OMXCHxJqpZJdD+DqBw3o2Kyif4UbKS7XrH2N91AhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e2A2qpI5HYeMpeC6BWXTXYOwYK6LiavtvtVphgp22zNvWfN03+JGmSH0vuyqIeCDXjfvGuIfGdZbPELQ4ijbDClZrvq9XCLG437mVlj59/Rq9ZcQgpN8XIYqEOW69v83B1uVTJf1mQ6cCtMt0T2FLNDtYxR+08AyFaKfdltc1Dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IgybHqmf; arc=fail smtp.client-ip=52.101.56.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IgybHqmf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npzAo0slRzGegpvsmnCwxTi8re57nqQAce8HUe+3JGjE7Rx7GW2I8J7P65e1RRyOt/AqkCKvc3YVffwfTloBcRf0EA+Xv7ZB8YC1sEy+cYap19viGQWqPQoLC621eYFm3x49zxm8U9cVo/u7V/3znRB4gUG+6620Rc7Em7/DKlwW+Qk2M44JtpyhzkaOviVavrtmIKRK3yIkEsrnRwAD2ouY5/kjdo/QH0Mtu8AnWMmUUifa5MPdyrdX31uo6hvIX+2G8KZ+lkcRv5GodKDU6mf2gkRAaE2/Yp4w4gTPFUKmHWSEhCZd52YhS5RFMz+KdFIigo9NKVO1OH1bz+lQ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0kKN+BAVEio0TjUBgNwFMrJDacKTl5nPet8gASb7Kw=;
 b=dxmFRY+CWjIS1CqQPoR8Zvxq9dw7tzbLpA3CjypNb9+W0Am8Mb/KLCXLuSSUUgAaiznT1f2jHqB5LIUhSLaSsO88BCmWjBM3LXJM9R3etVJxXDIB0ZyyedEKkUC+9fp/rxZwmqUEegvfpucqOLP+qaecV4r5jDDa4Yj10CN14xfG0QJr1JZcQUUT3mbrIVhqqnyX7sFIY/6sr2z+ZFNSDhoPMWPsPewGAd6pAiOi0KcSc/6VGjSefSSDuLaJw3Ht3UxOHdhXL7V6Vpa/EwJ/3OrxTxHIiTTGJCatw7totJ+X8GqvROyyscR+z0lAw9P/sY+HePDeZ03Kohf9PIA5wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0kKN+BAVEio0TjUBgNwFMrJDacKTl5nPet8gASb7Kw=;
 b=IgybHqmfvEn7yOXotxrTc+VKqyf0QRPMWEt3QGZnuIULWjKOfK49sI0rA4aBT98HXGQJP1A/fq1yX5HYYATCWn45JjwSI2T5gcd77J1O5Tzmhn9umwHQmeMiJuJa6/ibwk+Hoc9I1xVFTXeCU/xVb1vfp94Y62B9UIWRdJ+q3eal7OfnjQJajALiAykmDsqDBVdG0SlZZqvHmPnr6fq/nyjFg/SV/fAoceq5M6oDIptrU36aE+ovKhXztHXuGxHIYaL60sjj5SgC0TJMjhvJ4uuEiJSHknOGBgnOiP7q/yTRhkT8ncYfdcnPqnOkR8J8G8NZKxxl9embWZXWAqsDuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6125.namprd12.prod.outlook.com (2603:10b6:208:3c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 01:22:50 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 01:22:50 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 02/15] rust: sync: completion: add wait_for_completion_timeout()
Date: Fri, 28 Aug 2026 18:22:30 -0700
Message-ID: <20260829012243.496697-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829012243.496697-1-jhubbard@nvidia.com>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b7a5c98-e38c-4560-7c49-08df056c0a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IABZlgNqNbUyW2ZIcNHpOiez8nTPd8mIp05Ce9ItxYEPlklvGPPEMNxit3VHT1sRJmBM+N0BGIbVzzelSCKhRDtu6Sjm/CZoNWSHS/M4Tm2fKeu/FeC4HjexSuWb5wJfJgxl9cllhbwQ3in30b766injLoaYqJJF0um574KcZvByt6LYuuJ24X0Kds6PoX8dJbLk1E17NiKg8EdU18PN508Dg38h24uyeCxUay4FfoqhSB8RMG8RjoA/jBwghlleyKJQuo0k7TNMutKFD86dMFB21Cx8JiQXk81s2+/JoXqE1wsO05OaX6YEOgpaQQryMyHAc3V+s5HdhyF44WgNndEcewOsEfaaKyizAKi64z2HdwOiZ9rg7vAgZYPYGLZgHzqEuaKJlE5BlMcMgbwStOnuZhWDoEnPsqPmyTQdMKRgpW+EyThYo4W/JrYr8+GVWv3PZj4ZIHKLwqSSnMfpWcljnCGds5wiby1L1gWMNHCe2NWkTjMaoxIQosYR3zKFzazFLr6aJL8SNLGQmN8Ew5bLtuPeuat7AplvkRrvKXpD289ga0mFKvqgApl223/nU3hf8NTEBWT80+Nun3opgecw2qv/DZSldJRIAmLWku1Z3iQ6wkxftiproUyAsha4LypMBYTrprLrucSYfit87C60qoSGpP4AG9iYAtsbjVY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hfJTeUWvFC0HEvLBfLF5GlpsDniTi/647/X2tsmDC/OICXkuorjdvV0+4Hrg?=
 =?us-ascii?Q?eok+1wY2+XmQUpFV9/IikuMgoRHtcVbxZuR5aA+jMEfiStaQ8+vqovZ0svj7?=
 =?us-ascii?Q?ixGu6oIZBMVS0/VjmDVVOY86K0NlyYq2y3pq4qzQId/TnH7UObvbnlrxdJUB?=
 =?us-ascii?Q?dOa4FoGieq/GlTpAk1g7A8Qp9mnOAljL2VFWpzOHQQ0Pl0MEuJbsyn/JgQZv?=
 =?us-ascii?Q?43J5yqJe/y4nFGAmyqFWVqG76srXOBrDHKPBpZP++StRzlApURMRbFwUyME0?=
 =?us-ascii?Q?t4Fjs+vxa3PV1+NXrBpYH3fceQ7vNg7EHbiU6hCr6hS1gxuLyKNQYgHfA2CF?=
 =?us-ascii?Q?N2TF5IEwklvmjyHiMVhBoajfSUYtj9xtoumIfv9WYxpVdbLO9LaA0IrMxf2x?=
 =?us-ascii?Q?uf0/0YD7no8j5TxH266RIttCs86prwxI9geDGNnvbnwamh/KgZuOdIK5Ylzj?=
 =?us-ascii?Q?yhZMKi/jgNNdATD9LGrlmL64LjGrm2ONNrysaCuMpqukPujmBECjOPQW1FYg?=
 =?us-ascii?Q?XHIjrCvb3zd3/ptsvqInZYD2E4YYpWyzzOTR/b2NyK8X5c8EQRmted41cbF8?=
 =?us-ascii?Q?7d/SLMJCPyiZmKdao1jLsY+fxhGGWr1R2E0cELx2aRRbavL+/mcLdlwta6Mn?=
 =?us-ascii?Q?1amejfGPJ7thIOEAPBm9a8RfvaxIv2DWKSy/mdHJKLoNuRM6MLvPwOQiqGMz?=
 =?us-ascii?Q?RYakepUw2GvL06nIIZ+UhwntQ+TuT3B9S4FiFLvQqm3T4TH+cY1gdUyddz2y?=
 =?us-ascii?Q?zJvPaa4Ma4Hko5z964BwRXaH9ODtiTrxl3hXm0BuSVqQCgq5AFJKOvEXlH1U?=
 =?us-ascii?Q?siopeld4wvvS2WMqXhHO25awIPDIqT/8WbR/8J8zgX70fGSfZEs/9xjp6hqo?=
 =?us-ascii?Q?wpY5SwB1e+4y0zBcnNhTK+2l90bck1fFW8KjJFgdL90z8ZrsKF1CM38yzPcv?=
 =?us-ascii?Q?vvwRWS5BCsIHNZivluNTSn3bO/n7ZgxIaZcfKVEX8bLU6hRvh8D8PAoLDtQ3?=
 =?us-ascii?Q?RZuhnoonYXjyEt3le1fvLaVsuyjiWmXHCTqSq7ID52oLPhywahF+PElpE4IA?=
 =?us-ascii?Q?+tU97R/xxmtacfAYAeCf0fZzwLS09vMVygSXIoKtsOenViNLZtElAIKWZTSR?=
 =?us-ascii?Q?RuNMpXPsdbgrkHLfqRDR+VfT+FgyPg9meBnCSpYWtl2N5TWUlNtLho3cF23b?=
 =?us-ascii?Q?SQm0CIlodi/Qn1+iBuBx8iO70nyW1gFbLVpWRBR4bH1Tvx///S4PiNTS0z0k?=
 =?us-ascii?Q?75ZjGBdm5IvDi0ER8SzBU5MwWVQOxaQFBeClSIegmRRLlbjKgj/kVe3s2+Tf?=
 =?us-ascii?Q?1pPTjj+h4zKIHtOh5ylZ5X4AKjmM6c/Ky1iMHGuc68R7fg2Y2fv389ZXgAdm?=
 =?us-ascii?Q?jEiLGj+znM9KWA2ZM3OLqr6hFpVqOyjs7v/u1K6o6AtLjSNGBRSm18e7gp/A?=
 =?us-ascii?Q?ol+6UDRB7ne8CRZvyQ6IOw1QlhJtiTWzBLT1cbFJ0/rk4hx8ghh2Gck96l9D?=
 =?us-ascii?Q?MiwmcVVkIvGXMuYaWj1zA67IpkHDrWRYxwvbw3R6S57xD2EAZFzdM84MVcyq?=
 =?us-ascii?Q?zLUJrkIJOzPTHEkrRBcj9iAoeoCmvbNA/okf5U/2LX6fBZ0S1cGL4tv/rurS?=
 =?us-ascii?Q?59cmrog5i0ST+2oOLxWJM+oTM14EYFGfpXdu6B2yMXGrsN0Ru4fDmm0/o47j?=
 =?us-ascii?Q?rsRgmII1YG3cjwSC2hvFb5ax7vwfcY6hxxcq6DEt8NNH/OJ8QYvxRzszEHaH?=
 =?us-ascii?Q?9zbW8Re3Yg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b7a5c98-e38c-4560-7c49-08df056c0a94
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 01:22:50.3797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2mUNs1Wfs5IOi/r20dBmqp3/qvJlm+EsM/L7diYwJVlKSZhNlMjsxShPUIuif6oQhvwFJxw4RU1MxoFPK7Nng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6125

From: Joel Fernandes <joelagnelf@nvidia.com>

A driver that runs an interrupt self-test during probe waits for the
handler to fire. wait_for_completion() has no timeout, so a broken
interrupt path stalls probe indefinitely. Add a timeout variant of
wait_for_completion().

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
[jhubbard: return the remaining jiffies]
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/kernel/sync/completion.rs | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion.rs
index 35ff049ff078..7e8b3c1c880e 100644
--- a/rust/kernel/sync/completion.rs
+++ b/rust/kernel/sync/completion.rs
@@ -6,7 +6,12 @@
 //!
 //! C header: [`include/linux/completion.h`](srctree/include/linux/completion.h)
 
-use crate::{bindings, prelude::*, types::Opaque};
+use crate::{
+    bindings,
+    prelude::*,
+    time::Jiffies,
+    types::Opaque, //
+};
 
 /// Synchronization primitive to signal when a certain task has been completed.
 ///
@@ -111,4 +116,20 @@ pub fn wait_for_completion(&self) {
         // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
         unsafe { bindings::wait_for_completion(self.as_raw()) };
     }
+
+    /// Wait for completion of a task, with a timeout.
+    ///
+    /// This method waits for the completion of a task, or until `timeout` elapses. It is not
+    /// interruptible. Returns the number of jiffies left when the task completed, or [`None`] if
+    /// `timeout` elapsed first.
+    ///
+    /// See also [`Completion::complete_all`].
+    #[inline]
+    pub fn wait_for_completion_timeout(&self, timeout: Jiffies) -> Option<Jiffies> {
+        // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
+        match unsafe { bindings::wait_for_completion_timeout(self.as_raw(), timeout) } {
+            0 => None,
+            remaining => Some(remaining),
+        }
+    }
 }
-- 
2.55.0

