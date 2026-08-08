Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA87230C159
	for <nova-gpu@lists.linux.dev>; Sat,  8 Aug 2026 03:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158692; cv=fail; b=dfjOOGZp5zoAQt4FWr+UBpE6HGO4cavTfpyTnlwr9/jht7qnJ7iPlpPFWGMgRMZDK/ARIHDF2d6rmA+bF2W0TwFBaNduiYl/jrKIy+rMbr01ZLQ+luO2rPF3cfShSsP4aSr/83QcHNAoJV8BlAA2IT+oUmMdt+7tx7TaYBV0t2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158692; c=relaxed/simple;
	bh=cHSldXBlxIsxVe/1gLI51UUSEuF/ON0EqflutVnojd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FtkyY6LKIocQWzQwkdx9c+NnLCEOa0JDBbNY6GjpoPDMVQt8A0Uq8J+H0cbQMSFFvtO7Ri2PQMw9Zz7k8I9YWkjVR/QJbQZYmbwHrisGAIDWGLhvp68Q3JnKDJCYh2nUq/CMwrGnGAiTZhCYW5vzqQa5/oOzLZU3sxBAMso7YcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ebg9uB23; arc=fail smtp.client-ip=52.101.53.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ebg9uB23"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uB729+ZPnq8ng2JiUS8jAR9DOl1BAk5NhAJOEsfMvcc1B0GBBzst1wIdIgbDTQLyLOqjpRF+RsmBmaxxXh3aix6OTkvkJtE97Kd8XDE4FpYEPHW+HAGn+8ZXkPblm3ffMcUIIEF0bplrevpSVRsf38tY4my+DhKdS9LUU9857Inqv/yY6/TlX+if0RsEzb2geIJyc6opfNtasn9dl1ftmJE51eVLLPlwKWbmsEosViHhHjXScmnzNnj9wXql7y8y1JrruO3ESAwobyXUxn8eU4KTWWaAbCBZJhtbzELoH9zT7SQmAhzTtpr3EFDeqtAy+LI3RhkXbCMp4yz2givlSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sz726U65Hs7GYeJzuW8oLJsEyPQvc+4fuQtWr/2kCPA=;
 b=divC7XFWWGydKWVLxH/SOuxiJl+PdgNLIpzUBHTWQEJVzjfBMs9QHs9IWfKspJN5Nq3FWlZqEwT3YHrfllpXBwF2HDp8lEFD8YulMFywhV1tpzTgogMZuWS2gw9WRtbseDqdMVHlsLQZyiVodfwF95Ml/c7VbJgZX++9UcAXMiSqahOl3UC01u5ehWj6Hu0qmKD06Zugl2Vae7WuRl2TdUeqS4tf96oWxhlAxhKkXWstxF2AoiC3x7ETQWvEOuZvD9k/nbYS5+quxJYJz64Ayn1CxPIjqdIrRIwPmcEjl9huLCU8vlWFKMK8M9JcxZvo7m2t2VR0A7HHp08kKKvgpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sz726U65Hs7GYeJzuW8oLJsEyPQvc+4fuQtWr/2kCPA=;
 b=Ebg9uB23UHvGwkKwoc35ozbcRv39ef2ax4fzXFz9Q1V6GEGvNiSZIsYelY+zZ4m1xYZKW2qrN7u5zIUjsVoCRGjJTzyIEoFVRDy3vBdk/PySPuesiBEjsycZmvakzsSTkypYU7DSDVQZ4kRfRl64lbJqELUTIKnSjC/Q76RaL8TT6PTekNIdkApjUkbZB6s6bJto33fxhzUAcXyCCdKVzU1dV1lB3o2eSUdasE2LlRHeLaqy5FEfd7mqKSRQiaDid2uVU2U3J3ZOP8E3Wae4TPomRaXqgE824Tdhf+tYq2g47JGgRx3/PYlHW/P4X/BK4K3cb0cZPwRU2/Fvg4ioJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Sat, 8 Aug 2026 03:11:23 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:11:23 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
Subject: [PATCH 01/17] rust: sync: completion: add wait_for_completion_timeout()
Date: Fri,  7 Aug 2026 20:11:03 -0700
Message-ID: <20260808031120.363869-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808031120.363869-1-jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: d56def53-2c93-4724-d84b-08def4faba0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9mamXxYxpb6mvS8mGbTTzigBRTzYSBcrvMVsPqUavaLzRU8pMyFG9CjXcNaZuqVWvIjX7E2qj8LAEOMU1MltsrkQgX0VhkHJJjPPdvcpsaX2a3tKppjb7fCNl33JLYyUCM3yV5fWNTdA4Mv83teM+n1XEiEzsrB+PK1b8cIxwwAPfk1qgYURDws8MYbrjMFsDPnuqvfLGl9GyzuKpG3JBj2DnDhJVHieaXVUK6P/Uv7vbXz/njDorCbKBRM2S1PYNTxIpzTVe84G2BiZoMeVrMopDnG5a6BJUWZoKOplwUIr61omAPc67BOxpCC+BlQlWff/VW9M4rME4uKyMSd2dJoZC7zQ/QoBgBW5xioGFM3DCWzqPAghIwmeShy4cBV+0C2qXMoBZC74z+Ix10gYk/UwC9Lpnv4rESzIoC+Rb1SGyLeHxKMkikvqmsNbHjtFGVl16PqSilfa9RHBgsdLJ4xHfdSpxD478hw3LxEBrXmNEEBkZ6xkNor+rmDef4JvNeonlfMfTP1l/ewyeM7VuHVBXPMVPnA285NYbgDkz7L4aVwQcIIIjEgAKb6FAVcZm5x5JQjWNJ8JiU265tetc+NkhQx6eNJFqMHO1y1KGTP+PAzqTTr84pZWkfMauz1aarito3dyYbGmsiahCw+KOb0n3Rk8BF2aYTd+1oDxhW8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WL4FJ9OAdEcADAVHDMCyrehNSFxLPBTtJmioQ9Pr96xQtKDrMQCdyJkS4sYv?=
 =?us-ascii?Q?x+PEQ+Fupa9DkjfMgtRYRI6oCweygLyxr4gFCCuVzJRmX6deqMCydPc7hJcd?=
 =?us-ascii?Q?pQEjAIzQBNoP4VzJTgcSNJl4YHLvdYnQa8aHzADlm5/HzdNEwTBbU+3g9r7i?=
 =?us-ascii?Q?kXAIarOyPe9SSleFQh1Usf44RdSo87dI8wBcFg1Z2Zbg9ay4u3IYCW/oT9rf?=
 =?us-ascii?Q?HpAOiJG7rxR8o1YkZmiLU8L2V3S8bGz1nHb7uSqMTe3h7lffNuTzJV742mqW?=
 =?us-ascii?Q?gJhaiw4WbVED+55/k7exhIY46raO+mLqlizTVJAHJ1Uwe4wIwGh7K42IywDE?=
 =?us-ascii?Q?1h/5nCwOKiIMxgLgLSpGEdrzuuZm+fw6gVJIVwzOea2djsf5+yW5XJQeAD1S?=
 =?us-ascii?Q?s0Ri5kT5BQeAQyBap3ukYW9+kbNkFwhM67ai9bg4C0RcLhEsEXfeQXNY68iz?=
 =?us-ascii?Q?vQAap+BYA61VkECRQ/kKf1KCnE59cM3ooL8bGluOpRLLNytsqhCuoF/okPAB?=
 =?us-ascii?Q?m3Gt1+Flw35PP/4e3LgVc/7kLC0b0FSLVlx+0PpMUybRBUB98RkFmb7WZy2J?=
 =?us-ascii?Q?rwBH4QRevc3UeXAsPK4lW14LykgPfesxDaZVCI2eRx612YxADMY/Rf0rpywc?=
 =?us-ascii?Q?21eAELmm7vLKLcEX+PDyYIkYn3RlYNdepRybgTq03c+80M+Zhjrc2diC3R0M?=
 =?us-ascii?Q?twIQgH1C7C96jdCXElPXxfN69KzCs+Y1E3qxO4S1YRyJ/V/9/sj4ZX9NMmt3?=
 =?us-ascii?Q?umkX2FowpqlJrScnzcWWiNxKdzt8leicroiRl6Bmq7ADFPr4D/k8J2BxQJiE?=
 =?us-ascii?Q?ey5L3FeXjmplq5m/XUtdOdqIRVcXlXThYbodmHgNZ8/HXUppeb3vvyPXeNSj?=
 =?us-ascii?Q?r1xPVTTqwEk6bQc4jTgHMjEiKgaq7wZM7HmTOM/bihUoiHc66LRKrU6wSPb+?=
 =?us-ascii?Q?wmE7DDnAMu8wAH5JnnkMKNFCUDfbxpv/QtI9N0W2DIilCxbEeN9DVsMc65HJ?=
 =?us-ascii?Q?ky75eUxOVv9kYG+MgYeE+CVEBB9DId+UxHkqdML4UcgarUuwLV9wLy4FAMLQ?=
 =?us-ascii?Q?bg9JiOo3AMQF7W4YY5UlmaUd61xuvaV9jbHvhZbdtqu7jgY3JO9MMT0sMar5?=
 =?us-ascii?Q?X0Pdc8N002RANB7vE0bMt7NCe3qoijxuTWVLcdxkstp7hUbzxkyDg1hzKFHT?=
 =?us-ascii?Q?tjrdFLOdNjeCK0GEiacXa+xGerVGPgM+NQte3qLK3iHqkfJ8w5iXHM5+QrzG?=
 =?us-ascii?Q?QvtRkx70Z/7VfpiJ8LJIvJH/rdjLVebJDeNgNN+XpGmVxUdrqYvzWLC0pmPP?=
 =?us-ascii?Q?6/bznxih1sZGT7Ry1+ibz1jNzw5Kkh/z/pfLFL3U5SA7Fqk1AH9Y4r+UjR3k?=
 =?us-ascii?Q?brwMjCqOVTSbYXrOg9m1R5S9R8IrkGV7rikvnDx6U3BZLfPuKBIxhndz6Lwq?=
 =?us-ascii?Q?wA42D+COZrEUlYP6m8CpJGpm7yQXrFU5jBwLvcfuZS6ECWAiMI+4pvJ0qINI?=
 =?us-ascii?Q?PbpEC39HDagsjd83PLO8VxNdwReHN1JIeFY/6zs0jTsIEWlKhMoa5l7awq2X?=
 =?us-ascii?Q?G1XZln9oEANiD6DcGpw2l36QaVGrWguUXyjiBBySWnFTRQEgfBKeCgqcfTBh?=
 =?us-ascii?Q?rgfJ18HenbYCikLN8u1JHaPsgQy5IwlWHT8rTI9brLFLb0IfCyyryMd8xKvf?=
 =?us-ascii?Q?2/c2hdDAaJRdaHLia1qPkugEOkNlFfJMCAQSZqsroBqt1IrfmkETZhSZWNE2?=
 =?us-ascii?Q?xqHqwu2z4w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d56def53-2c93-4724-d84b-08def4faba0b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:11:23.4648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6eXQMwFxGpZl/bMZpfd9tCb7FyePKZt+UF0IUw5UOmkEItRs8TmTcwqLxdE3Msvfv8Vhgo7aSn1+yCHMPReqLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198

From: Joel Fernandes <joelagnelf@nvidia.com>

A driver that runs an interrupt self-test during probe waits for the
handler to fire. wait_for_completion() has no timeout, so a broken
interrupt path stalls probe indefinitely. Add a timeout variant of
wait_for_completion().

Document the type invariant that Completion always holds an initialized
struct completion, and cite it in the SAFETY comments.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
[jhubbard: return the remaining jiffies, document the type invariant,
 cite it in the SAFETY comments]
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/kernel/sync/completion.rs | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion.rs
index 35ff049ff078..b443c4999493 100644
--- a/rust/kernel/sync/completion.rs
+++ b/rust/kernel/sync/completion.rs
@@ -6,13 +6,22 @@
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
 /// The [`Completion`] synchronization primitive signals when a certain task has been completed by
 /// waking up other tasks that have been queued up to wait for the [`Completion`] to be completed.
 ///
+/// # Invariants
+///
+/// `inner` always holds an initialized `struct completion`.
+///
 /// # Examples
 ///
 /// ```
@@ -96,7 +105,8 @@ fn as_raw(&self) -> *mut bindings::completion {
     /// completion is permanently done, i.e. signals all current and future waiters.
     #[inline]
     pub fn complete_all(&self) {
-        // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
+        // SAFETY: By the type invariant, `self.as_raw()` is a pointer to an initialized
+        // `struct completion`.
         unsafe { bindings::complete_all(self.as_raw()) };
     }
 
@@ -108,7 +118,25 @@ pub fn complete_all(&self) {
     /// See also [`Completion::complete_all`].
     #[inline]
     pub fn wait_for_completion(&self) {
-        // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
+        // SAFETY: By the type invariant, `self.as_raw()` is a pointer to an initialized
+        // `struct completion`.
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
+        // SAFETY: By the type invariant, `self.as_raw()` is a pointer to an initialized
+        // `struct completion`.
+        match unsafe { bindings::wait_for_completion_timeout(self.as_raw(), timeout) } {
+            0 => None,
+            remaining => Some(remaining),
+        }
+    }
 }
-- 
2.55.0

