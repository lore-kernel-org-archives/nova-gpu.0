Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2202E03EA
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363714; cv=fail; b=ozPByU6n52NeFvVz7XpGs6GyaWiI+SmzT9MpFGjxgSCKMk/fLxbQSg6EKDF6iWS9uqMuu2R4sf+5sjAoCTpUf9xw4Hqz1La7D4joSg2DmuE31SHHJUmNh0Qglev7ojM2++xi/B81RPAGikK4vaNarlSpgox8BhY5tdOftr9VSy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363714; c=relaxed/simple;
	bh=TzFZtyFO2ftUxE3cAWov4uOxhXAo/a7de9m5zz1kYG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dO3BjgZkPTSO6Ke2wz0RYtlKjWj+q1a6etdrfH9bnv7t4oVsDN+695b+ksfg4sFpMybuXbv6Cu++U9m6Mkz5GzVN8B+Bz5n2XdL7kTf14z/5P+zS6X4vq3sH4IYmwImJjYE8yoFWqDam/AZmXTNl0miIWi2ndnEQNGbavs3KOfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=laPZzEhm; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="laPZzEhm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qf0CpCa8unTyzekcl5W4/wiABSSvOYhj8AWP1GQlopJ3JJ4dF5HAt+Mv0jGJ1m309+kUiXeT3KYVa/aKWzK6PztXxLHljEB4W2jyV5PLRDXvwkP3o2zd4OPQA7wCErWoP8hyojMz/ZIWj0nPxWDpWMnlXUdZWF4Hd9P2k51Raf+2DgP11LqMJkZ6Ubh8bNqK2qFcJzHTs+0UjKT5yH3Mz8xG+HHDIM1AxOpqtDLfV9Jwbj0kZvQGe2qqfWPecqbGUGfSs22QmXQfBAYDOgofv/1mgVM/WckyW6PlTez7oWchsi4erDDyPDTe4y3JzOSU5D8xiu4dNDwzJvmbmx3RFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SGs77mtOWer+pnjpGvTcNRurOkAIsK4xxb0WSYY440=;
 b=h9suHzLi8RlwJV/NyDeHwRcql/0xBTCc8tHWbA6wwADwM/k/UegT8MW28yxiqU4mpAgGNl7RwYFE7YL9koXfIFOHvQlxoDrtMztsjmOFmST8gRjYz/Dwj6ezfVDBs2g8ujwRKVUuSL7MgMM3B1Bhrt9cuyaxQhSY3o0KKpvPLldaMFxIVmjBz+0hIYa9Fhb+xAT40s8vC2GtchR1NMTtSuX7grKHM7g9JKh7y8wKekYj3seIM0oJJxciCnuznWQBwxqBOzts2wtNwUxfgACyonL6SqRaA9AWGKTDYURy1LtRisHuCLfyF7F42dQrag1We9MAwkH4BQJW1MnfHSmG7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SGs77mtOWer+pnjpGvTcNRurOkAIsK4xxb0WSYY440=;
 b=laPZzEhmGjtiY+hdYLxSDaqstDokgbXEB9J1dWpF4Y9lut+jZ6VdlFnOFo5z7UA6ev6vl6FDyF0htCkNJgHcBV37ipWpNmOYXwj+p6Jbvn4mEEwekTXiHWbH0AggXXlHwky2NKLNsbKd5GGrOphG4TNG3HLjuwA44GkSgEsG+PXoV+QwhC9klPH4VG4UJ1ahBQtO0SaqAemN42wBkY4PYsZ95oqdI4LK5e7T26hfsCGRxc2ssI58TAyi5h6pTaL9ShJZYBwNM22BxqO9fClUXa2jjI3AR9kixeGbTkyz7KPRzn2ehfJuUT+0+nHrVWM/VVf/P93Dhs+T5EXbpwJ0Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 01:55:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:07 +0000
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
Subject: [PATCH v2 04/31] gpu: nova-core: set MCTP transport header version to 1
Date: Fri, 21 Aug 2026 18:54:21 -0700
Message-ID: <20260822015448.238214-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 8baec488-6747-40bc-7622-08defff063f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dQERkaosTZBqeSm+8Ym62u9rXWLQczi+gbIq2KJ0O9KhbkINMm1cTjszWDW0Apr+SPz/usN+gF1KZU3w3tJpgmjHAGRVsDbgN4k8wiqHl6ATHsiCwtJluRzfilye12h1ZPmuAwZCthaTL9c5o379LzXqq3MffXMt7D45GoeeYb6qnPHnqipw4dmKKcp/oQ/70O7Gqft3Ao0j/4hJdSUn7oNa1irFQgRrmf6WV+uaHsAtrqfr3FJsWxImB/rWkm5NEKlzRMQPCf8orSueEsjvwMucxBxfTBI8Vpauf9qNRubFTDKtbgdqww1Bh3FCs3aybgK5IEQTPxRgJZFU/hPlXQIkqlfuV689ZTP0r5QnjDogH/wLQXjyRBaH2Y3P3uDGjF6yfsDWKzvxFDJjhNkQhsDwB+cpVkniYaTMuxIVhCFILYuY47eRWwontAg9Sdv/on2Wbr1MrsS+jOUJAj5rKv+beIJ57H823+NbQs64mA2ifvr7emra8Krw6YxH5Xt5PLvO8TqzBLf/1JHPbBKxebOnjZBHxJuetQkMCnWLo8komzvhFVJ5t4DOixUHxDqZEDlJYiUZTszUleINmpF22AUYFXu3O/p4isFRnnfSEchR9y7tG32jbi2uH5nL+CekSIxxHwgdsNEb37kSp+VaiMp+YOn4vadYo6bdrNfRmC0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TU+prvcD5tKMsE3msn4DGwpNReC1T23wNOmDhI4zXX2yo/2cbThoHeGkMbs3?=
 =?us-ascii?Q?OZI0k8mrgANbOFnPWUJ7RtpobcTAurGY+Yx1S6uGoEVs9RIkvNH+muS2zS5z?=
 =?us-ascii?Q?CtuF9XD2Uk3UhbZdgP5ZkWtJe4wa8aSIABon+sTQUgH/qMhh6QLOqNEZ49jt?=
 =?us-ascii?Q?5WGS8mo6/hqodReKRGKrODO3kmCnm2RBp55/QXNA3o3qb9U6B/LC4/3tJGdv?=
 =?us-ascii?Q?jfkRBKn/UfTb4wp3HQPkk+xZcmoS6jNvWDp1KBF1ue8MGARP3io6AM+YG/kl?=
 =?us-ascii?Q?MIuzxiOUCqMKXgarGVM3+Er7p7foH9q5TdsmGuUheoaPEyslgbMwI8gNjgMz?=
 =?us-ascii?Q?pljN5CacRtvF5g/kHHYugroDM57HmQxynKXlPGeTsKQo3s4MkaZQ9vuBKZ/r?=
 =?us-ascii?Q?4W2NoxUcD81roHW2xVLRqBXcq43x6+J511QdI3cqK9y8IzRYtR+9aKSwhnj6?=
 =?us-ascii?Q?llifqB27RwFOCA12lF5zbYq6n4lkEe5nNsOkSKdgAm51Lj6Sv5MKIJq/J6T+?=
 =?us-ascii?Q?fKA4E+CAfejpQK5XPKVH8po4c+Tq0PLCVaRNiHLwvkMx8RejoS78SMCwLsiF?=
 =?us-ascii?Q?VPevZLCwv822FvNRqi59WV+Ulg7W20MNUz/AeJUSo9pUZXHaW5gpTMQy4R9Q?=
 =?us-ascii?Q?KaEDujJDFRZkEbKaMzVKpv/rkgmBEPM6xri5dPZlMMx3RotbnDcVUdrLAj2a?=
 =?us-ascii?Q?ekXZvQsIQFBiYZhNNUkrQS7knGF0ZLkTLgPzSb+ihZDg1ibp3HrnoiIQJKpr?=
 =?us-ascii?Q?gXA5SXxXnalK5oNTC5UebbAa7ZvZitWtkTqpevOY+fXRte1ojVm0ra1tF20R?=
 =?us-ascii?Q?OZqxR2luJ1tvX3JCQN0riGRUgdrTzhtJrAwyfRdE8CKcK2WGwqiu8Hg9tege?=
 =?us-ascii?Q?BXd5tg82unO/b1WIoMTE+rqGRDI5E9JjNh8/WrPV7dBiyk3uOHyGip1qCPJP?=
 =?us-ascii?Q?M+W2Sj2cJ+uban7jmBQ1Yw+9x4a7zQo2GosglTVu2r5kfjPFuotZOqZwU41f?=
 =?us-ascii?Q?oIdrU9/kYB3jaKR0RKJ2Al2BOZtKcrOY7SqSXF0pz5/QUjhgWRQMmJ3xJefI?=
 =?us-ascii?Q?i7CKO5A94UN6kg7a4CyjolZLYoqCNORb8C501USoI25MicbbAlGMjlMuZq8M?=
 =?us-ascii?Q?9Z0XGRvK8Tpn04k86D5CbjQAjt45iGJeEcIMjUCIPe5ZzePB8Y3gvken+gLO?=
 =?us-ascii?Q?HbaIRwvW5JKfvlofdWwt0TXQTjZ9erBUyq4m9X7YvceA26qOSlyc74Kf/z/3?=
 =?us-ascii?Q?rdJ77gFV0EN5i2m6OzuuFP7Zy+sBMXq79br59cmZMhlmXYcdWiZmvjIH0NB7?=
 =?us-ascii?Q?GHO7kjdcTljq57bLs93e/Pk2PzlXOVXAOsII1eNVlSCbQOyrc6oMRwpwwAtj?=
 =?us-ascii?Q?pPO7bvukNv3pmHk/5gyitZbM0R7pA1C1QsiqHhqbTc529X90OYpX9ulHXWW+?=
 =?us-ascii?Q?Cd6oWIcp0dZyFTtefumwKONyZUyK9dS3/9JVeS6Vj2LmvCT8YPtlTJZ1Vy2/?=
 =?us-ascii?Q?O60M5/yd3AsaLcVjIgZLiDK7JgLvLVlC0tZi85lDoEsq1zTDdO0O53P6N4w0?=
 =?us-ascii?Q?2o5T8GhTyCPwy2PGx4WUs4K839QvZN/1HkFzJLDQAcsF05BZGA0HntcGyAiV?=
 =?us-ascii?Q?AHl/jkJPX3BrnsxONRVN2DxPWRqHau8GG/VKAAGtL3fER2RvDRQBpn3zSn83?=
 =?us-ascii?Q?SIK4xZKOaXvEHicdSa9lGQdwZnhK/rQoG76QfKZy1Oh0mnaB5J1XCSUDLtAq?=
 =?us-ascii?Q?xuua0KLFAA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8baec488-6747-40bc-7622-08defff063f9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:06.9129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DOSrsCc7FVdXk4CFJ1Qt+RtdrAY8IzE4zd1WmgXSNSFuh2PM7AJtlRhn9CrXmfirb4+KSxQxp2SERDbilHQAzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

FSP requires MCTP transport header version 1. Nova-core leaves version
bits 3:0 at zero, so every CoT and PRC request carries an invalid
transport header.

Define the version and destination endpoint ID fields. Set the version
to 1 for single-packet requests, and leave the unused destination
endpoint ID at zero.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Documentation/gpu/nova/core/fsp.rst |  2 ++
 drivers/gpu/nova-core/mctp.rs       | 14 ++++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/nova/core/fsp.rst b/Documentation/gpu/nova/core/fsp.rst
index 52d618d22bb8..60c647181da0 100644
--- a/Documentation/gpu/nova/core/fsp.rst
+++ b/Documentation/gpu/nova/core/fsp.rst
@@ -106,6 +106,8 @@ All FSP messages share a common header format consisting of two 32-bit words:
 - Bit 30: EOM (End of Message)
 - Bits 29:28: Packet sequence number
 - Bits 23:16: Source Endpoint ID
+- Bits 15:8: Destination Endpoint ID
+- Bits 3:0: MCTP header version (1)
 
 **NVDM header** (NVIDIA Vendor Defined Message):
 
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index 90c642c91a72..03546213da28 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -42,13 +42,23 @@ pub(crate) struct MctpHeader(u32) {
         29:28 seq;
         /// Source endpoint ID.
         23:16 seid;
+        /// Destination endpoint ID.
+        15:8 deid;
+        /// MCTP header version.
+        3:0 version;
     }
 }
 
 impl MctpHeader {
-    /// Builds a single-packet MCTP header (`SOM=1`, `EOM=1`, `SEQ=0`, `SEID=0`).
+    /// MCTP specification version 1.0.
+    const VERSION: u32 = 1;
+
+    /// Builds a single-packet MCTP header (`SOM=1`, `EOM=1`, `SEQ=0`, `SEID=0`, `VERSION=1`).
     pub(crate) fn single_packet() -> Self {
-        Self::zeroed().with_som(true).with_eom(true)
+        Self::zeroed()
+            .with_const_version::<{ Self::VERSION }>()
+            .with_som(true)
+            .with_eom(true)
     }
 
     /// Returns whether this is a complete single-packet message (`SOM=1` and `EOM=1`).
-- 
2.55.0

