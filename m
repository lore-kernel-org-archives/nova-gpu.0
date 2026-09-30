Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBD438CFE1
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 03:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739798; cv=fail; b=jhl5A2vfOSAHDJv2Bg1ZSowDhfTWoSkcrI69S6SGcUiIBg2U5D6XZ9C2Nufah+PbJdStZZ967l+6WZs8oroOzQtluZLe7udtoZC9R0M1lBiDiQo8OjrCM58I3+B3qiFaacfyCuKwlVv7B9yEu7kWRMwXxUKQmOTL96t9kQNb3iM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739798; c=relaxed/simple;
	bh=6dHiwb/k3IAubSrStjK3X4qw/6JXIyzLyO0xlMnGrl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mkKvTielnH/uM1FNIRMLrWIAllJiw/XdN+iGUa3z8eMyJYnpjyUVFGqbOEHxjvS++aAQw6BA/Ru8Y8kFg+NoFzEuGAJsv1TGTUzKpJPMHupiHkkLtv8YY7ZZM4cUmDVcNTT4685bvBLna74E5zpxa2C4rRPTxwU4PkOVzGJ+iEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N+NzeA+f; arc=fail smtp.client-ip=52.101.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N+NzeA+f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HousGSVMieKRO2M1dm51k58vezF0HUyb0kUoCfD6Oy4chx5wXMeDGZfNTzgsCv5a8SMIDYZLUFiCf3ZMhZBY/7tBTVt/Bgx1n7nI6rmdIkVsd8wIlEPZagdS9pHCqM3LhRWYdYN2pD4QpWIhVfbYYGB37b9LtyKLFBjHN4rdQHPyytPqjjGvI9IOdEhD0BX3G+hmtYA8ztoz04DNVaAxMtMxPBZEWc0XiguFqriQRURtOWJXkkhoNF6eMgM1dLWKgO2LTKwKNxFy8HZKUromJWiZXTd0CiiMqRubxSMmZIpxOgJhOihZWE0iIZPBcZbsiFL0+dXGMfn/zk1+O3VXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hok9xF6H90N0IEAbjg3wbh7NOy8uZmQbGdJ9sX1gmk4=;
 b=E6/6l03N4BtTHKv4W6JklZY/fKUtO/TxoKOcofSsS+d+U+wxQvbTvePB8iwkL1fV9/Mjh11VhaL9TJVxKk+nbldQAnkFR3DiB7Rs4joHUKagwR4cnuojWvZ39iO4yf7y1tgt6kk8vQFt00xz9sothI4S5oMebdmAzkbqucwn8mQT4VK7kX/EuWyoFmf4uVT3LYgRKl2vLmnXt3VvmAoAgrM+B4sPkmf7N9ruzXCMfWi7VAzSCV2XnvK6E/T2/gxk1f9SUv8gYVP+RHt4PR4nBPICH2FRkIWAyIqTobjcM+nEo6i07wCOQiN1GUEBvi/7b1pHfMeDlhmvXzCyqoDEhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hok9xF6H90N0IEAbjg3wbh7NOy8uZmQbGdJ9sX1gmk4=;
 b=N+NzeA+fd9AEeNa7Em+zKMzPlMmvpV4ffuy+XWjw85JgGC5xDMBGTAP9gPipquRCF9MF8u23ZAhY/mFZni6T7plUpi4fpPrziP1zJsvPS7viBJJws08FAPb8KpQbmMH0itti2cZOoIYfZ3zK1PHNGMexVzI831gzgrqNFQP/KnEqxruJ+xStdYOZtAlwr/KIR8EKXQRB+J7i3GNYQ0KoutjSgwKCU7i9ex/U4pPjjh3ZcBKPlbbPBjMnkdfG38V0PQs4qLAlBKAMGipeZpP3FGgvrLDMI9AH0j7NpkOXzeO0nppIrJV3favDa1GeEI/LP7dYFzzV5uBDsL4eD4+xFQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.26; Wed, 30 Sep 2026 03:42:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 03:42:22 +0000
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
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v5 10/15] gpu: nova-core: return ENOMSG for an unmatched GSP message
Date: Tue, 29 Sep 2026 20:41:43 -0700
Message-ID: <20260930034148.590687-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930034148.590687-1-jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0037.namprd07.prod.outlook.com
 (2603:10b6:510:e::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: dc6d32d0-a033-48ff-1cea-08df1ea4d5d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|56012099006|5023799004|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mkMetOFQeOvfE65hGTkqf1qMJsIbv6Ufz3ALGVpRuEc7sKm+oFZCcrvQN0Yov/zEKQW6YfIzl5Fs9InHgSumT9kzyQc+PHi/4Waye/M7KcMOHLd/5ZgDwzO/WeX0LYrEeOkjEKBY6XiEmZv5VusYm1Ivb0+bMv4/6JR6Movw40lgnLbi7zh7jW/eV2cZvEJCzwoJpUvoMpJgiZ968lUtANe2A5b/cTCtySACCcQANrwlNe10udWFhG6G+2aGQYLWn4mCs+pazR280tefFcz8ez1n4NT50PstqgvaVVegWmiFRPtAa1BBtKCWcEmqELNlSIye806E/exWbbj5qoq3cWs81eopVWzI9xaN8Gyr6DLycMroakpjSK0ADWGbzxJ+ztRVfAYfCYva7zi0K9PGSdSkc1sn5B2WmzteYkAi9kUmBYnAKF2LGe8Z9ZHaW7cCt+DyxwA3otSnxxDfpkLmuCjHFJqvQYiTOLWdrjq/2/dYIqX/g/EbnE2zNk8zkW3J9NuxEOpwrho0gNNz1hSTDosxtMuLaagw4IpkMm2N9e7v7nLFQRVO++wbCtk6u72A+aTMA0VCNNSx01Hjxfo0jpOVu8omV5ZD4y/uuhQNLXKJd3Md7XMjISeFAb2Uwjn8Ge49FA1Dv+NNvAtrICzhw97l0fhMsySD7iU53AtzWBo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(56012099006)(5023799004)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B7OZCCr77Cf76Mo1gbFpBJszh7cCZXProViukfElQyDJb+q/3ynJxmuMuEDf?=
 =?us-ascii?Q?xNblFya1P/75EmpXRG6TMUy0FN3S8Qjth7nXSzwpKSbWqg9of+IXlp6ziJFc?=
 =?us-ascii?Q?icdG4+NaECCFjOU/T1Cnb7IdZLdb0nJiFGwtsQUvJR6g+fNgLkiljYrzDaAz?=
 =?us-ascii?Q?p1ADQ1twOBENvXxJKRYe2E/MEjriOOUUoWW///7UcIYWvt/pQEGP5UnHQsyS?=
 =?us-ascii?Q?+DFu1UxEIAArm7MVZ1MHGHVB/w/DJNJyYD8PKznmK0YIoay7KKxT1/WWuxLL?=
 =?us-ascii?Q?9m42/5foTABVux6Rrvpl6shqmVifT1NYQ5+Tl7dXCoyju5/kLskTI/fMavg5?=
 =?us-ascii?Q?KsVIykHy3agmXPahIV9sf5vsBfnQHSl8VdHXfHzawSt2VRCObQl8AemQMDss?=
 =?us-ascii?Q?aClBNruRa5IUnoD6GlhAOJpdN5J/rEsPIOhTbv4JB9vIiyl03lwaD/z6KuwF?=
 =?us-ascii?Q?nsg6NVSYIKIB2Hgn46fKgurSCzFfg/uIomw9I6tm7APDUX7HLn8x3e05g+OV?=
 =?us-ascii?Q?ojOneBuWsi0F8aXFWmEGmxzJi/BG07MLnVz2hY6TZCkYnfHxjc6mOc8IrcFD?=
 =?us-ascii?Q?ro/uz5LaULAdM3eHl0q9OlsFvTcK+nDJEyMFR5PGlFpS/D2NCP/g8rpnBjSM?=
 =?us-ascii?Q?BOmkCstDqXiik4W1voop4Zzbbb9TNzZpF9gNfbzjRWmy+aHJ2a9DHQkQRd9v?=
 =?us-ascii?Q?IsGy9H+evRxZL/ui2mAmebSXDsrLrTiVcYCEf9os53mO7fD5Q51yXA82Lfgs?=
 =?us-ascii?Q?WO7C3CWvIA6iyJCRbqb3SkAKQ48dQEKa8mG7ze8epOZsVnEmdwD5ynGTpWjs?=
 =?us-ascii?Q?nEy85nOFJ0EZ7xqVgdMMaclNx8GzfyP05ARxN3/4ibw2dVlWLosL+UZmlSLW?=
 =?us-ascii?Q?bPOH4Zzr6F5k6cqOB2kG8WzVtMwuQNAu8zgO575dpaQh6EkQktc7QtAMzFjM?=
 =?us-ascii?Q?aLr7EkG0lwls8+jbNfl1wMxLdV/ADvGHYLda5P8WaszhatoYiwxW0gPZSJ+N?=
 =?us-ascii?Q?Js6HButg5Rn1egdDBc7XWyH1ay6PKwgm/TXlH5YbAg5rkL680KhnESSkhHBT?=
 =?us-ascii?Q?CiROqQqGTFFynTQ4t1F3k7dJryXp7IMcOCy/D+qhybTWLw8FbeMVHntzFm6o?=
 =?us-ascii?Q?5vLjeDHMD7bagYjsTLH/sZsmML2a7ObpG67oV/K0UHIA7TtsA6H1yTkWR9X4?=
 =?us-ascii?Q?Z4Z/wVBl7gBFi7BLrp+pSPQYMLvZK94hA/SgpgFCK0knkiE+U7P56Jzo0LHL?=
 =?us-ascii?Q?rN95a+tuqljVwP3Ax/UGyVqKMA+yOIYz+6HgX8XncdtAigL3HKSHKg2P4Gq6?=
 =?us-ascii?Q?Fh6rD2E5Kr+099+H12gSGRl6n7CSTPeNkqfwp+wtlZhnMk6l9OnK/NOT0jM9?=
 =?us-ascii?Q?GbjMgrQIlP6FEgkqCpxnkW/GRpVMaWKdQdiqMrwKsqbTZ7gPjw8oCwnNNmpG?=
 =?us-ascii?Q?506CSKutpQAT40bJ/e8dPjt4dVzBLMjGuHmNRXm6+AeV57ntQnkOW7OVdZCS?=
 =?us-ascii?Q?vARL4jcV2G0m5nT6Xe6OmawUTVzLIGGR/lEQEhS0VUNI4eVu1IjHHdS3YQSg?=
 =?us-ascii?Q?QQJoodotbtNxFVu5/mVJJbgDbKeME25bKnodgkqgVjMlvF7wo+TUZEevPx3U?=
 =?us-ascii?Q?+PFYSmUXEKDBfYRssbdy+C1euayq/JKwabY1w3KreAanHuCujWoipTs1yJHC?=
 =?us-ascii?Q?NLhyv5NRdvS5i6B0fFcCoxmAXLD+gNA3msSSmuHn/Lfoa+szxkzWp1Cw8gJ3?=
 =?us-ascii?Q?aw59J2Yj1Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6d32d0-a033-48ff-1cea-08df1ea4d5d3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:42:22.2089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylo/rPLH6Dvhw81PkgKzuotAOiN24i0OlyAyeBPPa2GREJxoMo9oEh9xxUquk4KkjXuv2WN8L+cEIzQAdQcoRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

The GSP posts unsolicited events on the same queue as command replies,
so a receive that asks for one message type has to report that the
message at the queue head was a different one.

That case returned ERANGE, which means a value outside a valid range and
says nothing about a message.

Return ENOMSG, no message of the desired type, instead.

Suggested-by: Gary Guo <gary@garyguo.net>
Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs      | 6 +++---
 drivers/gpu/nova-core/gsp/commands.rs  | 2 +-
 drivers/gpu/nova-core/gsp/sequencer.rs | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 4591f6c61ce6..ad2a14d08cb0 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -585,7 +585,7 @@ pub(crate) fn send_command<M>(&self, command: M) -> Result<M::Reply>
         loop {
             match inner.receive_msg::<M::Reply>(Self::RECEIVE_TIMEOUT) {
                 Ok(reply) => break Ok(reply),
-                Err(ERANGE) => continue,
+                Err(ENOMSG) => continue,
                 Err(e) => break Err(e),
             }
         }
@@ -828,7 +828,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
     /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
     ///   message queue.
-    /// - `ERANGE` if the message was not the awaited reply.
+    /// - `ENOMSG` if the message was not the awaited reply.
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
     fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
@@ -859,7 +859,7 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
         } else {
             self.log_event(function, seq);
 
-            Err(ERANGE)
+            Err(ENOMSG)
         };
 
         // Advance the read pointer past this message.
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 59d7d7fb15e8..0c787fd689bf 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -191,7 +191,7 @@ pub(crate) fn wait_gsp_init_done(cmdq: &Cmdq<'_>) -> Result {
     loop {
         match cmdq.receive_msg::<GspInitDone>(Cmdq::RECEIVE_TIMEOUT) {
             Ok(_) => break Ok(()),
-            Err(ERANGE) => continue,
+            Err(ENOMSG) => continue,
             Err(e) => break Err(e),
         }
     }
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index dae34c11eb05..1782ed7d7ca6 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -346,7 +346,7 @@ pub(crate) fn run(
         let seq_info = loop {
             match cmdq.receive_msg::<GspSequence>(Cmdq::RECEIVE_TIMEOUT) {
                 Ok(seq_info) => break seq_info,
-                Err(ERANGE) => continue,
+                Err(ENOMSG) => continue,
                 Err(e) => return Err(e),
             }
         };
-- 
2.55.0

