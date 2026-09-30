Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013031.outbound.protection.outlook.com [40.93.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EBB37BE6F
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 03:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739790; cv=fail; b=CnZxiwhnt6CawXedM+NPfbSrqwV3S8D9lVmw8oP6/tyBEkgyirOpjSHsHJsOGQ1vq9yHR5H5ql30p1k6f3Ge8xgZdB3kqi9PAAQ4HDY8ozXtFuL3yCo8lzg7lmDTtTwVhc4llVieCNO+fDyvs5JoNSvb6SdwaMA3O7q0mPlLhvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739790; c=relaxed/simple;
	bh=PHEEgZlGUSJn8PS45RQxtqM2X4fC4Swm+aR3phUqYHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=puoa8Tw8dbFM82gdE0+ikVxz/IW9xe5md1BYeT7Dmf+t6dQtBeYdSdoUp0FvMOLZzZvRx862GZd9JLnOFtNDCGDFyvaP8Iig8qS1e6ATzyjcieh1Ea1jLKEK7RAYEy/5FKlQpHDDACYXC6ABlh5b2B7o7T4ZJH1PYSTM8KX0abc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X68P+gUT; arc=fail smtp.client-ip=40.93.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X68P+gUT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VS0przTW4vgtfnn2V+BsB99PtGlGTF+6km0hH5LFqOTuYR2GfHB3ZmwgmnlkYWDWZ7ZOA+vIXOB2o1+PbnFqF79NRE79rrsc6ashrQf0NxlGpAARSFlH6B10byLxnFpfqyJDOoqe0rGxqd2OCcw2SobF4Ji3GodgvkJQuNK1VcjtdK6DrHNBWDiaVTaCgUc2Ed6Yq3IZC5jtRIxz58a3Bs3L3hE69jTtq7nrc2fcmfaK0NajNwjXkg0QdZGOMQh1KbehtI4xYV1SM/r/6YYjYTPUnyGl4JDc75//rPb9J4I6ba9arypHG0tn4th2GHkvfvyMjGSsL3yZ5dU1yZTy2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXmGQXXm1JUMMWqFnRtPDk3zWonekrtMqOZ1UvTJ4jk=;
 b=W3G82uhkDwJ3ONSjjhltXpdbR9NWhzSIhtLsabHXqUY0zQPrtdpK7EmyZ9cX/tU51vvyQmtDGx5/J1N8qOwmlsfY0WXcUZi3/p+salDbuTjnovx6U/AuFlR6tHLXxX9aVK7yHyX71x/ZKTfHdebpzzadzRPDvxlczZ/IhnFdJ2tKO+U0AFlfHJWfkSPqEpTKH8a6mE9C67Kuiec7Au+5bsg4Cpjkcmr+/0GNblfk9YFYyqgFpAudQLuNfOoYvhweGPlZdIXGet2HuaxVqk+xa/i+o2d+y5Rb1yPgVC97C3sCs8FAW7slx6g1Zl4bzAHXA+HQmhoC0nNo4MSeb0I7Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXmGQXXm1JUMMWqFnRtPDk3zWonekrtMqOZ1UvTJ4jk=;
 b=X68P+gUT8xKbuUAWUuDoYHXgfVfYPQxYPtDXasFeDmwUWd81ww/TA1y7Glx7/eXhd3IPZmwxSlXtQ5CMgWT+vq1OFxY34N7H6mquL9Ka6pgYU08CWN8haGtR+ZFy6OSSIdAtgZcPpzO0q5Hlo29jr/VxVXuS/misupp8QJ222Tipra0clcjfYD0x7AnGjNRim90UkJVpeBXIJIzsV5BQxUxU1d67Uc0EnKBg3LxBembGaoqh75vzGqZTLh0SNTq29FdApztW7EkJlc+3NMD90BZrNH3DTLY5byEIjzpwD7oXmiMEQxVU4mibciymdEH5XKabxMbfE90Oa8adGQ0TAQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.26; Wed, 30 Sep 2026 03:42:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 03:42:10 +0000
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
Subject: [PATCH v5 02/15] rust: sync: completion: add wait_for_completion_timeout()
Date: Tue, 29 Sep 2026 20:41:35 -0700
Message-ID: <20260930034148.590687-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930034148.590687-1-jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e776c2-e1ca-44b8-3996-08df1ea4cea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RwdhQE7nLKNpL+N6AhH/BUBnYjYdUVgSUf6bWo2vOQ/sojA1gH3PT/ZskPJqkZ0FmHnh2mnO1AHXV/Dj/V5Fnluh2We5szElCwcWbx1Tb/1xcVBsVg86c3gZ+rD21rs2bE1OGJZWxPOXANwR/jBeyEeRPNuh7VHf8+eFSo+zTCMn5q2yaleIWVm17DPXeS4vw4j1d6DEIhecY3iZTPUFU08DxxDBEZXoVbHoQ1ov4vDkzTYIGpA8YCH0hDMWHhBAb4Xl1UFhteHzgQAzIkoNL4rTc7bgY5ibyQHhfculWlafxdLTyF8hPga6nkJbUshkcwWVWWw7tLPK4/1wTalrpAJ+Tyb2cBdQuk4XZ4TsAVwmAy15IFEXTX2QR4kzd1lxjt9w7BNqQtJr0G3FVpUz6g23pqA3LP0vKKWqBOBZ4gd0JXRkH3AwCzuGYPCQWc8SoXIdnMg5oJdSCYo4ItugW2Rpsa+/rS2n4tMwZ8ReRL61phTVVqLNRMWu/ndGhSSNgb3NLzKl21HXed/ZtD5Ps8zK1TWau3pjP8cOOd2ScXaSLADO3acoJMxKnFvAFKtaY48SP3MVrl5PQyVuAIG16V6ZVxXFUuUYA895SNN4CNADzW0ETxE4+SBWyEoc6xX7A0qEsr9nL3GK1210vL11CgsF9OcBpw6zf+tBtnd7ITM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sj4TLUNbfnoUduw5+jaz+G6GBXVX8DpEwQ9c6EfnBofuuUP3Ea0rUnTxWp44?=
 =?us-ascii?Q?WNuW0+VWa4HqcslfnyXFaOCJzEnyx88vAq8SdHwvSFurdxz7Aj2M0cWF6Rvt?=
 =?us-ascii?Q?4bmRUJyPyb01GtM19GvHp3vgnwx+qcdKnZqurmbhAqHLEmGJgUbEtZdEqFhJ?=
 =?us-ascii?Q?yzDXsCCUfZHMC4Ctv8aeDeSF6jMby8VDWiAz68x0Oc0fje0Mu3rVvTHraZs4?=
 =?us-ascii?Q?wFdfBmiYY3u2vL1Vhr9JGyNDaoOfH0qiC4Qe5P7gE3NR/ai204YhwXyLX8vP?=
 =?us-ascii?Q?EsCHaJSNAWWDb0DBtDtrRQs/nlbwsjMv7tl5Sy/ct9lHMYIk51P2MkxO0Ae4?=
 =?us-ascii?Q?ppdum+Id1ze7dBa4HKvnmC6XmjA+hKtxywvqGJtDTyq8jWsq4TWAdWefBf0w?=
 =?us-ascii?Q?rPsIDznKbuQiWzjRn+ZD6DGLoXfbWLOToE2lAgVOx1aiyN7LFNBvtR+cmiMC?=
 =?us-ascii?Q?v0gbSOr9LTblHrApYS6YbwJ5mAmotqVzaBCzddnYB4BB8cTNA+K7KGnZ8J5c?=
 =?us-ascii?Q?Lmh5K5cPMb/OgUeSDXjHVGbH5BayX61H6E+IQZUGijCtdwmzjzBkWE3iUB35?=
 =?us-ascii?Q?f7XfgvcaV9P9lypEsXR5dvRbe3KULkIL3Vpk/cjbsX8A9ns54NeUBN+kPKoG?=
 =?us-ascii?Q?pET046P6CjoEvrS/99Ovy/2m6DpesMr70EyXbx8V0rujFmk+6jLIld2WIS0F?=
 =?us-ascii?Q?pihc75pyzyNwijdeyjv+E78fDEXalbz5Uo7uMN16oYNMsJov4cyPGXHJaDfe?=
 =?us-ascii?Q?7jS/1rmtMUaK/bXdTUz5MdIVyNaF4hYSxez4OH2QiXx7GZDrQXZ+KjGzBIld?=
 =?us-ascii?Q?SrPHYuNq2L8U8MY6jc5k8NNTzAqeHa8JWHv93BMOAHA8kPjBBRvC77Eg0Esw?=
 =?us-ascii?Q?QV34vyqUJZTjLykBKrF+D69mct5tTLiFuyBL8teCrAK6zu9EgcIE4ExWVtrj?=
 =?us-ascii?Q?W8iFcJeEmWX0aTpKySV2pZ7sud1gGE7H6tcLNn0W4clVDWNKmWSLRtWBuAp3?=
 =?us-ascii?Q?2s5amtibBS93MwtlhgMVKSdGUO7EVDenmlNNj8APw4T5iXY2G+k2qg5PQXTg?=
 =?us-ascii?Q?zWHFgsq2sKqHc624TbvxQVOkacqyqKTKb7K0vbJWlQIBwEvRel9n6vkcw6aV?=
 =?us-ascii?Q?ldSjydd+T4pNaUF/bU8idx6XkXsm3E3xz1rRdjQI8MKxIT7vL2jOX1RsZ8p4?=
 =?us-ascii?Q?mpMxfIQ8Ce8df7Jj5F6EBixiYHlwkU14xS+xH4lf/YhlOi+bC2lqr6owBybP?=
 =?us-ascii?Q?ZmajnIanUqgdKHYDihZDaiDufLvYuVQdesUJSJ/0k86n1fbdz6TiejVvxbYU?=
 =?us-ascii?Q?JYm6+jOBhPSrtdAYjWjHazszzRlJWbMCfB5mPoEczHBMRWORVzzon8vIK+kH?=
 =?us-ascii?Q?DjD6KBqtPiCDR8ijP0CP8R+oQlAwZ5SodrIYvZXn3+7MPQhob1h1WBUlRD5w?=
 =?us-ascii?Q?uNgRrAYdwLAWFr3leoLJjWB6k54UfyxEpPC3pApDLhcnShaniFNklOsyW+Lo?=
 =?us-ascii?Q?i5n1yWNLn0+NHrA0miIpd6HNyIwkTAyvESXEKVVZ3nRwG3gqg3Uk0ivMozli?=
 =?us-ascii?Q?lPVVKKLDmKBgQdZBvYVHFTakvSKPyY1sUMrFV/RR3KVXNZz8HpOtHgEFKwuy?=
 =?us-ascii?Q?BXM0I+Vf1JGhIjX+GypbFaNC5QJDg6piOwJMTm0OtzFBBoPplxE/HIWrfX9u?=
 =?us-ascii?Q?w0o/zF/jMWOyJ2upQAuEOtb0Wh5lKqv0NQRXT0m6p6gCVKnpOxc5TAlKaZq6?=
 =?us-ascii?Q?+j5bPA7G9Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e776c2-e1ca-44b8-3996-08df1ea4cea7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:42:10.1910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dYLxpLN8f5NgU9yzMOYUo3l5U2CbjN1i8CWuOpZ00tOIZqrm67qE4flqGEuwFYnTiR6qXCpsXlYc2VfeU6+EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

From: Joel Fernandes <joelagnelf@nvidia.com>

A driver that runs an interrupt self-test during probe waits for the
handler to fire. wait_for_completion() has no timeout, so a broken
interrupt path stalls probe indefinitely. Add a timeout variant of
wait_for_completion().

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
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

