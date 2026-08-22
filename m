Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB946263F5D
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363721; cv=fail; b=K9Nz0HGteGEBw18yIxwy5y3yPS++40nc+6KDbuq8uuu3vLAHPXQKSXel5qvudg8FQhKSoCp+U2bJLNR/e9XvjOQZuifvBKuH1rqlub/cEgqQc73rwwjDfqFOi7JeLOwWiQaqTeHtBnqrPEFebPE/4nrY8M7LQNdCEO6XESTZnv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363721; c=relaxed/simple;
	bh=QhLXTnUyveGA0z6SC4AmX7xXWNloA5ifuthfjdqR9D0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TzzWtPpdEkn0+atJ9wMR9gG7FErRrw8vJ/J0Fgd9jKM6gyh9pSZbN2L0NXlmjA9OHltLk5Bnt6MSxzBB5l3bcpQ4yYBEoxH5bgvd4qTfPF3ZjADcuyxV17B63iMS6WaV/6i9eWy4fm8ZfjGQi8vn/R2NZIPjUokLbtTZV8TuXFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dz7RmsEI; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dz7RmsEI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlWvjaLtRQkwBZPNBCoaJrdyqGyEBqiOyy2jIpPu541qKZKlqXyPoLXnZoCsXYGgmF/5yAn2WN4Cwn3ajbK9UaM7Fba20kDziCs2uFG7ODDBGSXJa20FTPkeq07xCFwnY10hXI04xAK/VN+f6GpA9/DufHECtZuD5e8OUVeTZg5/Y2LLoL91RW+K4qhXA2ntZKNQHguYWJK7s3gk6UFG6yz2vzZyHJiX28PreYXpftlwM8OMY3i3GNhwaiKiu56bRVwu9SdlkHwybJubBXEfnaVv2LOljpprL8xzH9eJkl19pfVN+IEzSpc9kMtNF9R0j0EMuvlvVYwnyHXTEKB1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxWRujWr35csFQP6Wo7RBBXxAbpvzqHbs1gKiFjgGfE=;
 b=C3Qy3YuFOQEplSTLjCB+Nli00YfkQVf4Rj8CNSlBVocL9plfhD6AqYsiylwQj3rL8V3pc2/R4Ax4sLgbEvwkHan38lUvYCj5ghHp9q+ObTVzlTlXpvJcIKlp8giUTrOkvs3Z6c4KSAiNInJc4T6o+9oWFLUmfBzrSG8V8VUayljw0xe7Hg1qaeujSXl4ptKIwvnYybkGJ9XEltnn7zGGHnWJLaBmGtIB6EB7NLri3YwQm0d5KrVNWrpycdiDtKEnxrHAc+3ry6CVl+Wq5kWxZwdSxuoMp0hJ4L5Q+/onpf/jaYO/v1UZ3obJkk7BKi9MwOUx2M4h8986N7Ki9bIl5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxWRujWr35csFQP6Wo7RBBXxAbpvzqHbs1gKiFjgGfE=;
 b=dz7RmsEIrxKNULOxgPVlcgM+xSipNzoAG1kz/6A9YLUV41zEsi+o0H0xOrKLBCNEKugoIw+mAfjBJwh5AzHudbzl0cdsii+RmbcaZnDSskIhjRkZfhP4EyVg1z4z+INw0Wqh66kBi6Q8GBgQcCHR4yyMPtLov9P3SVP3wlOR4Yo8QmMDxF5PKxe4G76S7Uu4k9PHhRyuTml48j/mAh3SWe7VaPxzL1y9Fbz15F6BMA0hZLTf8s1HsLR1GWzL0sFdgaySGTOXGE0Kpxyn1mmG0bq4XHDvQFANI/SEJX6uZUrkswPVqBdM5OcRSAbHtbWne4KhWXkMekO+5vsqHeTOFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 01:55:01 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:00 +0000
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
Subject: [PATCH v2 02/31] gpu: nova-core: firmware: add r000 bindings
Date: Fri, 21 Aug 2026 18:54:19 -0700
Message-ID: <20260822015448.238214-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a778ee-90d9-4055-731a-08defff0604c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|6133799003|3023799007|56012099006|10067099003|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1UkKb60yKXd08wYc6FeM4/5HvotJO3oDvwlFNZ/m+9Cg2iPYw/Z65XEmNu4HjeduOD/rYCC/bj2JafsVt9dW12CR6iGAno/uWzuZ3eVnLMPfWZdmA6TVl/22tKpRFgUmBL+MBgyQ2ZS7AGHkol2/1TpaAR+KQRImtwdd8GKCxFbxOasGr7eDhyZ3BBHjaFcwD31j78m5dEE2hk49LijBjMm86kM0cQwduAkrOY4cnPIntKJRdxDUVVlx4WUVZmxtM9ljpTKmG5A5WqDCqjNegmt0KIz0n6pdj4Aiju1xzdxpF/4nNT6po/4RYdo30N7Y6j3SrU+glRaaWxrSvna1qIY6Kh8wcOnusbkkq/r/9sFQwuSULSH0URQwko78cwPgClxn6ov5UoxerrjmGMFJQ8Pqg6w8bzatCbemOLQ/wNJDsx1V4XGtUa6/GlpCMemgBHiZrXlUwO5wAjUHiTmS+JWsYSVx/+xQEyUtnloXzVwtTvluAiCcBV0KSYI5KZOfoZGDnV+2bArpSmbfLvFq9i3IiSDT/FkZXBs+G+a6kVRwmn/aSFOLv8Sl8ZM2c8QBUNXQ0zoa6XgKYqSOVa87NgC3LLSPWGRGmNBWaLAsJYd3eTsrWqUBSnApCPLlivRXxF5zpHvZoskN5SsOzEZprz4FG3Tp8GDd19NmCXr//MY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(6133799003)(3023799007)(56012099006)(10067099003)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+pC9DvlTgUez0Zf8I4IJs6oKQSC4Ss5onkZtdNNJ7/OvYWCy2R3OZIgF8m2v?=
 =?us-ascii?Q?3VKKNKqYHxy7HCUXy09l0MksZBgRASZB28QhEvhFIlohobbBuOB9LNxj0P3w?=
 =?us-ascii?Q?qwLrnHzEcfdYMREn3tf2Hl6k8+61rvmR8Igb11c7TqoUYdOopyyfKUkWMqpb?=
 =?us-ascii?Q?feueBU7kFaxnen+GuEYo08vm0wZXIcBLQpw/b7/msjJ1XRVPPcMun9dZMEn/?=
 =?us-ascii?Q?qq3qgQUkLm8ASUOjw5gi0DMm31kJHVHYlZIhT39HNg4gKKA1gTIIKczXvwhV?=
 =?us-ascii?Q?dLDf/HvSsl1zSLCyPucTI097/HBxE/Mxgp2dvWSHmDqMBU3ouOt3GKYBvde2?=
 =?us-ascii?Q?uxQxmJmJh5zPHObBhnF4qIWucGWn8cBosikpcRfv+W+S7bo3obQFLwR6ZJBd?=
 =?us-ascii?Q?KmF8BiFNLujyPY01QHGl9jSBPzXIbyQP/TKM9HFhKTSiOOa4J0Iu97EnPda8?=
 =?us-ascii?Q?D0gSLxIMxFf8PB9zKZ02sEwEsKU3ecqDcjHfv5mUDeUj65Bo/OBbm1WoU2jO?=
 =?us-ascii?Q?9L6tjfnXshA9z+exMRUFWTsJEiqc084Jw85RLIe159NOBrguSi663cUCoW3Z?=
 =?us-ascii?Q?qsI4GvHyqZiVZu7TAQcY1S4pbCJnH4PtDWk7ymukQVTgOBxjrb60qLuH7+CV?=
 =?us-ascii?Q?Nx88FXOQGKRZAVf3J5ZpSNS+y09AyOV/S0HfY19K9AA6nBRXnjciD9nPxS50?=
 =?us-ascii?Q?aECf0OkxvHu/ZgKQMMhFfP+k/dmdZ4AXxcU6OTSeKtmYMHinDlHtu96zbbra?=
 =?us-ascii?Q?ECnA/kcMlx6lwm6nzGazxrgYgzoYMF6cYQ9pR1+WlcwJayIVs9HijaKywZkV?=
 =?us-ascii?Q?xGUSZ/cN86QAnfT4/xqfUIfA0ogRZeRClb4s5949uOYrvkBximQZk8/vVT2t?=
 =?us-ascii?Q?KjboT5kS4Xlq9vG/AcFRpswG2AG6dWZUfJ9h9BeL3UMZqo3YiR3mb7WmX5j8?=
 =?us-ascii?Q?NgC+4FyeYeQT+Uc2jGms8fFTi+zjLKBsMzQz4Rqm1n0FufJ0wQ3vnQt4u4bQ?=
 =?us-ascii?Q?0aKK1FqcyaZr8dRtOkdcWWSJze+aStFAApeYUHSIJs6K95erneK3IMgwFu2i?=
 =?us-ascii?Q?BjeFDqYbP8XeI2YpjFNtCKnyxIy3+xO8zi9sa/GV5Dz8M72hTBqDUc6QEG0j?=
 =?us-ascii?Q?NzxbXEPqRC2cTu8trh5E6ywxdkne3L/iJxTKkeT53dBrJc4+f9St+jaZR3ZW?=
 =?us-ascii?Q?kJDg+WjrUyAeOS5lT7/nWOyRENl0rHj8SkqmwLUeMB0NawJcr5GZaBUYW//N?=
 =?us-ascii?Q?Z32RQzUbywRhOFpP1UxYXaGH7rgNtETmB7iYhdOfrQdcEhicSezivPFfwudy?=
 =?us-ascii?Q?vrGB5taH2sOqCQHu8wld4aHi3hD9gxH+LKRXzc9xgvfqm9Jb1umfOAljqbhy?=
 =?us-ascii?Q?my52LV9k2fDvVE+AIRbIA389bjdKWoRUmBo0k9uot82ozX3LCt/qmQKU1T48?=
 =?us-ascii?Q?HMwFFNRW9zlA6c7uoqHU6pVNlydKGbHFmNg6Xpp9g6AdM/qmBUaQ9dGwRPzh?=
 =?us-ascii?Q?cyFUUokO7C/GxnumhdSOnWuzhlJUWjBi4WatfcNZYfEkrqRpio37NZuQ3a9E?=
 =?us-ascii?Q?UR8F2+29ijbY/cuYRoHZAEY5wCwYs6yy2w/VjZ2A/jwnT8QUlY0w0yaTEUb5?=
 =?us-ascii?Q?FbL5hWo7Qo2yUmBfSzq1ZNu/kZj8jCQAXL8RUfnocMGvzvxwndilzJdOwGYA?=
 =?us-ascii?Q?FuJquB/APwxmftd/AKtxVIFrhj2an1oIuBK/qnQArnbjc1bAMarAHTsALjQk?=
 =?us-ascii?Q?eZKtSprq4w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a778ee-90d9-4055-731a-08defff0604c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:00.7947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUUDc+6ejomAIHBIso4UfG5qwaycNKgdMVP8fKvRyHpHbGizQRQqO/ugEfr2AKSwnzCP8/X2IyBoAqS3E/xdLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

"r000" means "latest firmware", without getting bogged down into naming
actual versions, because those will vary. The story is: nova uses
r570 at this point, but will transition soon to some later version, and
that version will have a stable ABI, which in turn means that the
firmware file names will stop including version numbers in the file name
itself. Version information will still be recorded inside each firmware
image, though.

Add generated firmware bindings from the r000 Open RM headers. The
module is registered but not yet wired as the active binding set.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs               |    1 +
 drivers/gpu/nova-core/gsp/fw/r000_00.rs       |   31 +
 .../gpu/nova-core/gsp/fw/r000_00/bindings.rs  | 1210 +++++++++++++++++
 3 files changed, 1242 insertions(+)
 create mode 100644 drivers/gpu/nova-core/gsp/fw/r000_00.rs
 create mode 100644 drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 0b01c81ec092..9b29308678a7 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -2,6 +2,7 @@
 // SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 pub(crate) mod commands;
+mod r000_00;
 mod r570_144;
 
 // Alias to avoid repeating the version number with every use.
diff --git a/drivers/gpu/nova-core/gsp/fw/r000_00.rs b/drivers/gpu/nova-core/gsp/fw/r000_00.rs
new file mode 100644
index 000000000000..095e5dddf6cf
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/r000_00.rs
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Firmware bindings.
+//!
+//! Imports the generated bindings by `bindgen`.
+//!
+//! This module may not be directly used. Please abstract or re-export the needed symbols in the
+//! parent module instead.
+
+#![allow(
+    dead_code,
+    clippy::all,
+    clippy::undocumented_unsafe_blocks,
+    clippy::ptr_as_ptr,
+    clippy::ref_as_ptr,
+    missing_docs,
+    non_camel_case_types,
+    non_upper_case_globals,
+    non_snake_case,
+    improper_ctypes,
+    unreachable_pub,
+    unsafe_op_in_unsafe_fn
+)]
+use kernel::ffi;
+use pin_init::MaybeZeroable;
+
+include!("r000_00/bindings.rs");
+
+// SAFETY: This type has a size of zero, so its inclusion into another type should not affect their
+// ability to implement `Zeroable`.
+unsafe impl<T> kernel::prelude::Zeroable for __IncompleteArrayField<T> {}
diff --git a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
new file mode 100644
index 000000000000..90c31883b5f9
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
@@ -0,0 +1,1210 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#[repr(C)]
+#[derive(Default)]
+pub struct __IncompleteArrayField<T>(::core::marker::PhantomData<T>, [T; 0]);
+impl<T> __IncompleteArrayField<T> {
+    #[inline]
+    pub const fn new() -> Self {
+        __IncompleteArrayField(::core::marker::PhantomData, [])
+    }
+    #[inline]
+    pub fn as_ptr(&self) -> *const T {
+        self as *const _ as *const T
+    }
+    #[inline]
+    pub fn as_mut_ptr(&mut self) -> *mut T {
+        self as *mut _ as *mut T
+    }
+    #[inline]
+    pub unsafe fn as_slice(&self, len: usize) -> &[T] {
+        ::core::slice::from_raw_parts(self.as_ptr(), len)
+    }
+    #[inline]
+    pub unsafe fn as_mut_slice(&mut self, len: usize) -> &mut [T] {
+        ::core::slice::from_raw_parts_mut(self.as_mut_ptr(), len)
+    }
+}
+impl<T> ::core::fmt::Debug for __IncompleteArrayField<T> {
+    fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+        fmt.write_str("__IncompleteArrayField")
+    }
+}
+#[repr(C)]
+pub struct __BindgenUnionField<T>(::core::marker::PhantomData<T>);
+impl<T> __BindgenUnionField<T> {
+    #[inline]
+    pub const fn new() -> Self {
+        __BindgenUnionField(::core::marker::PhantomData)
+    }
+    #[inline]
+    pub unsafe fn as_ref(&self) -> &T {
+        ::core::mem::transmute(self)
+    }
+    #[inline]
+    pub unsafe fn as_mut(&mut self) -> &mut T {
+        ::core::mem::transmute(self)
+    }
+}
+impl<T> ::core::default::Default for __BindgenUnionField<T> {
+    #[inline]
+    fn default() -> Self {
+        Self::new()
+    }
+}
+impl<T> ::core::clone::Clone for __BindgenUnionField<T> {
+    #[inline]
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+impl<T> ::core::marker::Copy for __BindgenUnionField<T> {}
+impl<T> ::core::fmt::Debug for __BindgenUnionField<T> {
+    fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+        fmt.write_str("__BindgenUnionField")
+    }
+}
+impl<T> ::core::hash::Hash for __BindgenUnionField<T> {
+    fn hash<H: ::core::hash::Hasher>(&self, _state: &mut H) {}
+}
+impl<T> ::core::cmp::PartialEq for __BindgenUnionField<T> {
+    fn eq(&self, _other: &__BindgenUnionField<T>) -> bool {
+        true
+    }
+}
+impl<T> ::core::cmp::Eq for __BindgenUnionField<T> {}
+pub const NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_0: u32 = 0;
+pub const NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3: u32 = 3;
+pub const NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_7: u32 = 7;
+pub const NV_VGPU_MSG_SIGNATURE_VALID: u32 = 1129337430;
+pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2: u32 = 0;
+pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL: u32 = 23068672;
+pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X: u32 = 8388608;
+pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u32 = 18874368;
+pub const GSP_FW_HEAP_PARAM_SIZE_PER_GB: u32 = 98304;
+pub const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE: u32 = 100663296;
+pub const GSP_FW_HEAP_SIZE_VGPU_DEFAULT: u32 = 609222656;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB: u32 = 64;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB: u32 = 256;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB: u32 = 88;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
+pub const GSP_FW_WPR_META_REVISION: u32 = 1;
+pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
+pub const REGISTRY_TABLE_ENTRY_TYPE_DWORD: u32 = 1;
+pub type __u8 = ffi::c_uchar;
+pub type __u16 = ffi::c_ushort;
+pub type __u32 = ffi::c_uint;
+pub type __u64 = ffi::c_ulonglong;
+pub type u8_ = __u8;
+pub type u16_ = __u16;
+pub type u32_ = __u32;
+pub type u64_ = __u64;
+pub const NV_VGPU_MSG_FUNCTION_NOP: _bindgen_ty_2 = 0;
+pub const NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO: _bindgen_ty_2 = 1;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_ROOT: _bindgen_ty_2 = 2;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE: _bindgen_ty_2 = 3;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY: _bindgen_ty_2 = 4;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA: _bindgen_ty_2 = 5;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA: _bindgen_ty_2 = 6;
+pub const NV_VGPU_MSG_FUNCTION_MAP_MEMORY: _bindgen_ty_2 = 7;
+pub const NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA: _bindgen_ty_2 = 8;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT: _bindgen_ty_2 = 9;
+pub const NV_VGPU_MSG_FUNCTION_FREE: _bindgen_ty_2 = 10;
+pub const NV_VGPU_MSG_FUNCTION_LOG: _bindgen_ty_2 = 11;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_VIDMEM: _bindgen_ty_2 = 12;
+pub const NV_VGPU_MSG_FUNCTION_UNMAP_MEMORY: _bindgen_ty_2 = 13;
+pub const NV_VGPU_MSG_FUNCTION_MAP_MEMORY_DMA: _bindgen_ty_2 = 14;
+pub const NV_VGPU_MSG_FUNCTION_UNMAP_MEMORY_DMA: _bindgen_ty_2 = 15;
+pub const NV_VGPU_MSG_FUNCTION_GET_EDID: _bindgen_ty_2 = 16;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_DISP_CHANNEL: _bindgen_ty_2 = 17;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_DISP_OBJECT: _bindgen_ty_2 = 18;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_SUBDEVICE: _bindgen_ty_2 = 19;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_DYNAMIC_MEMORY: _bindgen_ty_2 = 20;
+pub const NV_VGPU_MSG_FUNCTION_DUP_OBJECT: _bindgen_ty_2 = 21;
+pub const NV_VGPU_MSG_FUNCTION_IDLE_CHANNELS: _bindgen_ty_2 = 22;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_EVENT: _bindgen_ty_2 = 23;
+pub const NV_VGPU_MSG_FUNCTION_SEND_EVENT: _bindgen_ty_2 = 24;
+pub const NV_VGPU_MSG_FUNCTION_REMAPPER_CONTROL: _bindgen_ty_2 = 25;
+pub const NV_VGPU_MSG_FUNCTION_DMA_CONTROL: _bindgen_ty_2 = 26;
+pub const NV_VGPU_MSG_FUNCTION_DMA_FILL_PTE_MEM: _bindgen_ty_2 = 27;
+pub const NV_VGPU_MSG_FUNCTION_MANAGE_HW_RESOURCE: _bindgen_ty_2 = 28;
+pub const NV_VGPU_MSG_FUNCTION_BIND_ARBITRARY_CTX_DMA: _bindgen_ty_2 = 29;
+pub const NV_VGPU_MSG_FUNCTION_CREATE_FB_SEGMENT: _bindgen_ty_2 = 30;
+pub const NV_VGPU_MSG_FUNCTION_DESTROY_FB_SEGMENT: _bindgen_ty_2 = 31;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_SHARE_DEVICE: _bindgen_ty_2 = 32;
+pub const NV_VGPU_MSG_FUNCTION_DEFERRED_API_CONTROL: _bindgen_ty_2 = 33;
+pub const NV_VGPU_MSG_FUNCTION_REMOVE_DEFERRED_API: _bindgen_ty_2 = 34;
+pub const NV_VGPU_MSG_FUNCTION_SIM_ESCAPE_READ: _bindgen_ty_2 = 35;
+pub const NV_VGPU_MSG_FUNCTION_SIM_ESCAPE_WRITE: _bindgen_ty_2 = 36;
+pub const NV_VGPU_MSG_FUNCTION_SIM_MANAGE_DISPLAY_CONTEXT_DMA: _bindgen_ty_2 = 37;
+pub const NV_VGPU_MSG_FUNCTION_FREE_VIDMEM_VIRT: _bindgen_ty_2 = 38;
+pub const NV_VGPU_MSG_FUNCTION_PERF_GET_PSTATE_INFO: _bindgen_ty_2 = 39;
+pub const NV_VGPU_MSG_FUNCTION_PERF_GET_PERFMON_SAMPLE: _bindgen_ty_2 = 40;
+pub const NV_VGPU_MSG_FUNCTION_PERF_GET_VIRTUAL_PSTATE_INFO: _bindgen_ty_2 = 41;
+pub const NV_VGPU_MSG_FUNCTION_PERF_GET_LEVEL_INFO: _bindgen_ty_2 = 42;
+pub const NV_VGPU_MSG_FUNCTION_MAP_SEMA_MEMORY: _bindgen_ty_2 = 43;
+pub const NV_VGPU_MSG_FUNCTION_UNMAP_SEMA_MEMORY: _bindgen_ty_2 = 44;
+pub const NV_VGPU_MSG_FUNCTION_SET_SURFACE_PROPERTIES: _bindgen_ty_2 = 45;
+pub const NV_VGPU_MSG_FUNCTION_CLEANUP_SURFACE: _bindgen_ty_2 = 46;
+pub const NV_VGPU_MSG_FUNCTION_UNLOADING_GUEST_DRIVER: _bindgen_ty_2 = 47;
+pub const NV_VGPU_MSG_FUNCTION_TDR_SET_TIMEOUT_STATE: _bindgen_ty_2 = 48;
+pub const NV_VGPU_MSG_FUNCTION_SWITCH_TO_VGA: _bindgen_ty_2 = 49;
+pub const NV_VGPU_MSG_FUNCTION_GPU_EXEC_REG_OPS: _bindgen_ty_2 = 50;
+pub const NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO: _bindgen_ty_2 = 51;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_VIRTMEM: _bindgen_ty_2 = 52;
+pub const NV_VGPU_MSG_FUNCTION_UPDATE_PDE_2: _bindgen_ty_2 = 53;
+pub const NV_VGPU_MSG_FUNCTION_SET_PAGE_DIRECTORY: _bindgen_ty_2 = 54;
+pub const NV_VGPU_MSG_FUNCTION_GET_STATIC_PSTATE_INFO: _bindgen_ty_2 = 55;
+pub const NV_VGPU_MSG_FUNCTION_TRANSLATE_GUEST_GPU_PTES: _bindgen_ty_2 = 56;
+pub const NV_VGPU_MSG_FUNCTION_RESERVED_57: _bindgen_ty_2 = 57;
+pub const NV_VGPU_MSG_FUNCTION_RESET_CURRENT_GR_CONTEXT: _bindgen_ty_2 = 58;
+pub const NV_VGPU_MSG_FUNCTION_SET_SEMA_MEM_VALIDATION_STATE: _bindgen_ty_2 = 59;
+pub const NV_VGPU_MSG_FUNCTION_GET_ENGINE_UTILIZATION: _bindgen_ty_2 = 60;
+pub const NV_VGPU_MSG_FUNCTION_UPDATE_GPU_PDES: _bindgen_ty_2 = 61;
+pub const NV_VGPU_MSG_FUNCTION_GET_ENCODER_CAPACITY: _bindgen_ty_2 = 62;
+pub const NV_VGPU_MSG_FUNCTION_VGPU_PF_REG_READ32: _bindgen_ty_2 = 63;
+pub const NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO_EXT: _bindgen_ty_2 = 64;
+pub const NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO: _bindgen_ty_2 = 65;
+pub const NV_VGPU_MSG_FUNCTION_RMFS_INIT: _bindgen_ty_2 = 66;
+pub const NV_VGPU_MSG_FUNCTION_RMFS_CLOSE_QUEUE: _bindgen_ty_2 = 67;
+pub const NV_VGPU_MSG_FUNCTION_RMFS_CLEANUP: _bindgen_ty_2 = 68;
+pub const NV_VGPU_MSG_FUNCTION_RMFS_TEST: _bindgen_ty_2 = 69;
+pub const NV_VGPU_MSG_FUNCTION_UPDATE_BAR_PDE: _bindgen_ty_2 = 70;
+pub const NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD: _bindgen_ty_2 = 71;
+pub const NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO: _bindgen_ty_2 = 72;
+pub const NV_VGPU_MSG_FUNCTION_SET_REGISTRY: _bindgen_ty_2 = 73;
+pub const NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU: _bindgen_ty_2 = 74;
+pub const NV_VGPU_MSG_FUNCTION_SUBDEV_EVENT_SET_NOTIFICATION: _bindgen_ty_2 = 75;
+pub const NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL: _bindgen_ty_2 = 76;
+pub const NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO2: _bindgen_ty_2 = 77;
+pub const NV_VGPU_MSG_FUNCTION_DUMP_PROTOBUF_COMPONENT: _bindgen_ty_2 = 78;
+pub const NV_VGPU_MSG_FUNCTION_UNSET_PAGE_DIRECTORY: _bindgen_ty_2 = 79;
+pub const NV_VGPU_MSG_FUNCTION_GET_CONSOLIDATED_STATIC_INFO: _bindgen_ty_2 = 80;
+pub const NV_VGPU_MSG_FUNCTION_GMMU_REGISTER_FAULT_BUFFER: _bindgen_ty_2 = 81;
+pub const NV_VGPU_MSG_FUNCTION_GMMU_UNREGISTER_FAULT_BUFFER: _bindgen_ty_2 = 82;
+pub const NV_VGPU_MSG_FUNCTION_GMMU_REGISTER_CLIENT_SHADOW_FAULT_BUFFER: _bindgen_ty_2 = 83;
+pub const NV_VGPU_MSG_FUNCTION_GMMU_UNREGISTER_CLIENT_SHADOW_FAULT_BUFFER: _bindgen_ty_2 = 84;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_VGPU_FB_USAGE: _bindgen_ty_2 = 85;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_NVFBC_SW_SESSION_UPDATE_INFO: _bindgen_ty_2 = 86;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_NVENC_SW_SESSION_UPDATE_INFO: _bindgen_ty_2 = 87;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESET_CHANNEL: _bindgen_ty_2 = 88;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESET_ISOLATED_CHANNEL: _bindgen_ty_2 = 89;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_HANDLE_VF_PRI_FAULT: _bindgen_ty_2 = 90;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CLK_GET_EXTENDED_INFO: _bindgen_ty_2 = 91;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_BOOST: _bindgen_ty_2 = 92;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_VPSTATES_GET_CONTROL: _bindgen_ty_2 = 93;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_ZBC_CLEAR_TABLE: _bindgen_ty_2 = 94;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_ZBC_COLOR_CLEAR: _bindgen_ty_2 = 95;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_ZBC_DEPTH_CLEAR: _bindgen_ty_2 = 96;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPFIFO_SCHEDULE: _bindgen_ty_2 = 97;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_TIMESLICE: _bindgen_ty_2 = 98;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PREEMPT: _bindgen_ty_2 = 99;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FIFO_DISABLE_CHANNELS: _bindgen_ty_2 = 100;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_TSG_INTERLEAVE_LEVEL: _bindgen_ty_2 = 101;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_CHANNEL_INTERLEAVE_LEVEL: _bindgen_ty_2 = 102;
+pub const NV_VGPU_MSG_FUNCTION_GSP_RM_ALLOC: _bindgen_ty_2 = 103;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_P2P_CAPS_V2: _bindgen_ty_2 = 104;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CIPHER_AES_ENCRYPT: _bindgen_ty_2 = 105;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CIPHER_SESSION_KEY: _bindgen_ty_2 = 106;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CIPHER_SESSION_KEY_STATUS: _bindgen_ty_2 = 107;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_CLEAR_ALL_SM_ERROR_STATES: _bindgen_ty_2 = 108;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_READ_ALL_SM_ERROR_STATES: _bindgen_ty_2 = 109;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_EXCEPTION_MASK: _bindgen_ty_2 = 110;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_PROMOTE_CTX: _bindgen_ty_2 = 111;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_CTXSW_PREEMPTION_BIND: _bindgen_ty_2 = 112;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_SET_CTXSW_PREEMPTION_MODE: _bindgen_ty_2 = 113;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_CTXSW_ZCULL_BIND: _bindgen_ty_2 = 114;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_INITIALIZE_CTX: _bindgen_ty_2 = 115;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES: _bindgen_ty_2 = 116;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FIFO_CLEAR_FAULTED_BIT: _bindgen_ty_2 = 117;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_LATEST_ECC_ADDRESSES: _bindgen_ty_2 = 118;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_MC_SERVICE_INTERRUPTS: _bindgen_ty_2 = 119;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DMA_SET_DEFAULT_VASPACE: _bindgen_ty_2 = 120;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_CE_PCE_MASK: _bindgen_ty_2 = 121;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_ZBC_CLEAR_TABLE_ENTRY: _bindgen_ty_2 = 122;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_NVLINK_PEER_ID_MASK: _bindgen_ty_2 = 123;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_NVLINK_STATUS: _bindgen_ty_2 = 124;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_P2P_CAPS: _bindgen_ty_2 = 125;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_P2P_CAPS_MATRIX: _bindgen_ty_2 = 126;
+pub const NV_VGPU_MSG_FUNCTION_RESERVED_0: _bindgen_ty_2 = 127;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESERVE_PM_AREA_SMPC: _bindgen_ty_2 = 128;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESERVE_HWPM_LEGACY: _bindgen_ty_2 = 129;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_B0CC_EXEC_REG_OPS: _bindgen_ty_2 = 130;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_BIND_PM_RESOURCES: _bindgen_ty_2 = 131;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SUSPEND_CONTEXT: _bindgen_ty_2 = 132;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_RESUME_CONTEXT: _bindgen_ty_2 = 133;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_EXEC_REG_OPS: _bindgen_ty_2 = 134;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_MODE_MMU_DEBUG: _bindgen_ty_2 = 135;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_READ_SINGLE_SM_ERROR_STATE: _bindgen_ty_2 = 136;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_CLEAR_SINGLE_SM_ERROR_STATE: _bindgen_ty_2 = 137;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_MODE_ERRBAR_DEBUG: _bindgen_ty_2 = 138;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_NEXT_STOP_TRIGGER_TYPE: _bindgen_ty_2 = 139;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_ALLOC_PMA_STREAM: _bindgen_ty_2 = 140;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PMA_STREAM_UPDATE_GET_PUT: _bindgen_ty_2 = 141;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FB_GET_INFO_V2: _bindgen_ty_2 = 142;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FIFO_SET_CHANNEL_PROPERTIES: _bindgen_ty_2 = 143;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_GET_CTX_BUFFER_INFO: _bindgen_ty_2 = 144;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_KGR_GET_CTX_BUFFER_PTES: _bindgen_ty_2 = 145;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_EVICT_CTX: _bindgen_ty_2 = 146;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FB_GET_FS_INFO: _bindgen_ty_2 = 147;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GRMGR_GET_GR_FS_INFO: _bindgen_ty_2 = 148;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_STOP_CHANNEL: _bindgen_ty_2 = 149;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_PC_SAMPLING_MODE: _bindgen_ty_2 = 150;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_RATED_TDP_GET_STATUS: _bindgen_ty_2 = 151;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_RATED_TDP_SET_CONTROL: _bindgen_ty_2 = 152;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FREE_PMA_STREAM: _bindgen_ty_2 = 153;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_TIMER_SET_GR_TICK_FREQ: _bindgen_ty_2 = 154;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FIFO_SETUP_VF_ZOMBIE_SUBCTX_PDB: _bindgen_ty_2 = 155;
+pub const NV_VGPU_MSG_FUNCTION_GET_CONSOLIDATED_GR_STATIC_INFO: _bindgen_ty_2 = 156;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_SINGLE_SM_SINGLE_STEP: _bindgen_ty_2 = 157;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_GET_TPC_PARTITION_MODE: _bindgen_ty_2 = 158;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_SET_TPC_PARTITION_MODE: _bindgen_ty_2 = 159;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_ALLOCATE: _bindgen_ty_2 = 160;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_DESTROY: _bindgen_ty_2 = 161;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_MAP: _bindgen_ty_2 = 162;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_UNMAP: _bindgen_ty_2 = 163;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_PUSH_STREAM: _bindgen_ty_2 = 164;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_SET_HANDLES: _bindgen_ty_2 = 165;
+pub const NV_VGPU_MSG_FUNCTION_UVM_METHOD_STREAM_GUEST_PAGES_OPERATION: _bindgen_ty_2 = 166;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_INTERNAL_QUIESCE_PMA_CHANNEL: _bindgen_ty_2 = 167;
+pub const NV_VGPU_MSG_FUNCTION_DCE_RM_INIT: _bindgen_ty_2 = 168;
+pub const NV_VGPU_MSG_FUNCTION_REGISTER_VIRTUAL_EVENT_BUFFER: _bindgen_ty_2 = 169;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_EVENT_BUFFER_UPDATE_GET: _bindgen_ty_2 = 170;
+pub const NV_VGPU_MSG_FUNCTION_GET_PLCABLE_ADDRESS_KIND: _bindgen_ty_2 = 171;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_LIMITS_SET_STATUS_V2: _bindgen_ty_2 = 172;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_INTERNAL_SRIOV_PROMOTE_PMA_STREAM: _bindgen_ty_2 = 173;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_MMU_DEBUG_MODE: _bindgen_ty_2 = 174;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_INTERNAL_PROMOTE_FAULT_METHOD_BUFFERS: _bindgen_ty_2 = 175;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FLCN_GET_CTX_BUFFER_SIZE: _bindgen_ty_2 = 176;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FLCN_GET_CTX_BUFFER_INFO: _bindgen_ty_2 = 177;
+pub const NV_VGPU_MSG_FUNCTION_DISABLE_CHANNELS: _bindgen_ty_2 = 178;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FABRIC_MEMORY_DESCRIBE: _bindgen_ty_2 = 179;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FABRIC_MEM_STATS: _bindgen_ty_2 = 180;
+pub const NV_VGPU_MSG_FUNCTION_SAVE_HIBERNATION_DATA: _bindgen_ty_2 = 181;
+pub const NV_VGPU_MSG_FUNCTION_RESTORE_HIBERNATION_DATA: _bindgen_ty_2 = 182;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_INTERNAL_MEMSYS_SET_ZBC_REFERENCED: _bindgen_ty_2 = 183;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_EXEC_PARTITIONS_CREATE: _bindgen_ty_2 = 184;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_EXEC_PARTITIONS_DELETE: _bindgen_ty_2 = 185;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPFIFO_GET_WORK_SUBMIT_TOKEN: _bindgen_ty_2 = 186;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPFIFO_SET_WORK_SUBMIT_TOKEN_NOTIF_INDEX: _bindgen_ty_2 = 187;
+pub const NV_VGPU_MSG_FUNCTION_PMA_SCRUBBER_SHARED_BUFFER_GUEST_PAGES_OPERATION: _bindgen_ty_2 =
+    188;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_MASTER_GET_VIRTUAL_FUNCTION_ERROR_CONT_INTR_MASK:
+    _bindgen_ty_2 = 189;
+pub const NV_VGPU_MSG_FUNCTION_RESERVED_190: _bindgen_ty_2 = 190;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SUBDEVICE_GET_P2P_CAPS: _bindgen_ty_2 = 191;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_BUS_SET_P2P_MAPPING: _bindgen_ty_2 = 192;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_BUS_UNSET_P2P_MAPPING: _bindgen_ty_2 = 193;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FLA_SETUP_INSTANCE_MEM_BLOCK: _bindgen_ty_2 = 194;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_MIGRATABLE_OPS: _bindgen_ty_2 = 195;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_TOTAL_HS_CREDITS: _bindgen_ty_2 = 196;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_HS_CREDITS: _bindgen_ty_2 = 197;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_HS_CREDITS: _bindgen_ty_2 = 198;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PM_AREA_PC_SAMPLER: _bindgen_ty_2 = 199;
+pub const NV_VGPU_MSG_FUNCTION_INVALIDATE_TLB: _bindgen_ty_2 = 200;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_QUERY_ECC_STATUS: _bindgen_ty_2 = 201;
+pub const NV_VGPU_MSG_FUNCTION_ECC_NOTIFIER_WRITE_ACK: _bindgen_ty_2 = 202;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_GET_MODE_MMU_DEBUG: _bindgen_ty_2 = 203;
+pub const NV_VGPU_MSG_FUNCTION_RM_API_CONTROL: _bindgen_ty_2 = 204;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_INTERNAL_GPU_START_FABRIC_PROBE: _bindgen_ty_2 = 205;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_NVLINK_GET_INBAND_RECEIVED_DATA: _bindgen_ty_2 = 206;
+pub const NV_VGPU_MSG_FUNCTION_GET_STATIC_DATA: _bindgen_ty_2 = 207;
+pub const NV_VGPU_MSG_FUNCTION_RESERVED_208: _bindgen_ty_2 = 208;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_GET_INFO_V2: _bindgen_ty_2 = 209;
+pub const NV_VGPU_MSG_FUNCTION_GET_BRAND_CAPS: _bindgen_ty_2 = 210;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_NVLINK_INBAND_SEND_DATA: _bindgen_ty_2 = 211;
+pub const NV_VGPU_MSG_FUNCTION_UPDATE_GPM_GUEST_BUFFER_INFO: _bindgen_ty_2 = 212;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_INTERNAL_CONTROL_GSP_TRACE: _bindgen_ty_2 = 213;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_ZBC_STENCIL_CLEAR: _bindgen_ty_2 = 214;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SUBDEVICE_GET_VGPU_HEAP_STATS: _bindgen_ty_2 = 215;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SUBDEVICE_GET_LIBOS_HEAP_STATS: _bindgen_ty_2 = 216;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_MODE_MMU_GCC_DEBUG: _bindgen_ty_2 = 217;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_GET_MODE_MMU_GCC_DEBUG: _bindgen_ty_2 = 218;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESERVE_HES: _bindgen_ty_2 = 219;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RELEASE_HES: _bindgen_ty_2 = 220;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESERVE_CCU_PROF: _bindgen_ty_2 = 221;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RELEASE_CCU_PROF: _bindgen_ty_2 = 222;
+pub const NV_VGPU_MSG_FUNCTION_SETUP_HIBERNATION_BUFFER: _bindgen_ty_2 = 223;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_GET_CHIPLET_HS_CREDIT_POOL: _bindgen_ty_2 = 224;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_GET_HS_CREDITS_MAPPING: _bindgen_ty_2 = 225;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_EXEC_PARTITIONS_EXPORT: _bindgen_ty_2 = 226;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_INTERNAL_GPU_CHECK_CTS_ID_VALID: _bindgen_ty_2 = 227;
+pub const NV_VGPU_MSG_FUNCTION_INIT_GSP_TRACE_CRASH_BUFFER: _bindgen_ty_2 = 228;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_SET_MIGRATION_BLOCK: _bindgen_ty_2 = 229;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FIFO_VGPU_SWRUNLIST_SUBMIT: _bindgen_ty_2 = 230;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FIFO_VGPU_SWRUNLIST_CHANNEL_UPDATE: _bindgen_ty_2 = 231;
+pub const NV_VGPU_MSG_FUNCTION_NUM_FUNCTIONS: _bindgen_ty_2 = 232;
+pub type _bindgen_ty_2 = ffi::c_uint;
+pub const NV_VGPU_MSG_EVENT_FIRST_EVENT: _bindgen_ty_3 = 4096;
+pub const NV_VGPU_MSG_EVENT_GSP_INIT_DONE: _bindgen_ty_3 = 4097;
+pub const NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER: _bindgen_ty_3 = 4098;
+pub const NV_VGPU_MSG_EVENT_POST_EVENT: _bindgen_ty_3 = 4099;
+pub const NV_VGPU_MSG_EVENT_RC_TRIGGERED: _bindgen_ty_3 = 4100;
+pub const NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED: _bindgen_ty_3 = 4101;
+pub const NV_VGPU_MSG_EVENT_OS_ERROR_LOG: _bindgen_ty_3 = 4102;
+pub const NV_VGPU_MSG_EVENT_RG_LINE_INTR: _bindgen_ty_3 = 4103;
+pub const NV_VGPU_MSG_EVENT_GPUACCT_PERFMON_UTIL_SAMPLES: _bindgen_ty_3 = 4104;
+pub const NV_VGPU_MSG_EVENT_SIM_READ: _bindgen_ty_3 = 4105;
+pub const NV_VGPU_MSG_EVENT_SIM_WRITE: _bindgen_ty_3 = 4106;
+pub const NV_VGPU_MSG_EVENT_SEMAPHORE_SCHEDULE_CALLBACK: _bindgen_ty_3 = 4107;
+pub const NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT: _bindgen_ty_3 = 4108;
+pub const NV_VGPU_MSG_EVENT_VGPU_GSP_PLUGIN_TRIGGERED: _bindgen_ty_3 = 4109;
+pub const NV_VGPU_MSG_EVENT_PERF_GPU_BOOST_SYNC_LIMITS_CALLBACK: _bindgen_ty_3 = 4110;
+pub const NV_VGPU_MSG_EVENT_PERF_BRIDGELESS_INFO_UPDATE: _bindgen_ty_3 = 4111;
+pub const NV_VGPU_MSG_EVENT_VGPU_CONFIG: _bindgen_ty_3 = 4112;
+pub const NV_VGPU_MSG_EVENT_DISPLAY_MODESET: _bindgen_ty_3 = 4113;
+pub const NV_VGPU_MSG_EVENT_EXTDEV_INTR_SERVICE: _bindgen_ty_3 = 4114;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_256: _bindgen_ty_3 = 4115;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_512: _bindgen_ty_3 = 4116;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_1024: _bindgen_ty_3 = 4117;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_2048: _bindgen_ty_3 = 4118;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_4096: _bindgen_ty_3 = 4119;
+pub const NV_VGPU_MSG_EVENT_TIMED_SEMAPHORE_RELEASE: _bindgen_ty_3 = 4120;
+pub const NV_VGPU_MSG_EVENT_NVLINK_IS_GPU_DEGRADED: _bindgen_ty_3 = 4121;
+pub const NV_VGPU_MSG_EVENT_PFM_REQ_HNDLR_STATE_SYNC_CALLBACK: _bindgen_ty_3 = 4122;
+pub const NV_VGPU_MSG_EVENT_NVLINK_FAULT_UP: _bindgen_ty_3 = 4123;
+pub const NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE: _bindgen_ty_3 = 4124;
+pub const NV_VGPU_MSG_EVENT_MIG_CI_CONFIG_UPDATE: _bindgen_ty_3 = 4125;
+pub const NV_VGPU_MSG_EVENT_UPDATE_GSP_TRACE: _bindgen_ty_3 = 4126;
+pub const NV_VGPU_MSG_EVENT_NVLINK_FATAL_ERROR_RECOVERY: _bindgen_ty_3 = 4127;
+pub const NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD: _bindgen_ty_3 = 4128;
+pub const NV_VGPU_MSG_EVENT_FECS_ERROR: _bindgen_ty_3 = 4129;
+pub const NV_VGPU_MSG_EVENT_RECOVERY_ACTION: _bindgen_ty_3 = 4130;
+pub const NV_VGPU_MSG_EVENT_TRIGGER_BUGCHECK: _bindgen_ty_3 = 4131;
+pub const NV_VGPU_MSG_EVENT_BIND_BAR2: _bindgen_ty_3 = 4132;
+pub const NV_VGPU_MSG_EVENT_FORCED_DRIVER_SHUTDOWN: _bindgen_ty_3 = 4133;
+pub const NV_VGPU_MSG_EVENT_GSP_LOAD_EXEC_GENERIC_BOOTLOADER: _bindgen_ty_3 = 4134;
+pub const NV_VGPU_MSG_EVENT_GSP_LOAD_EXEC_HS_BINARY: _bindgen_ty_3 = 4135;
+pub const NV_VGPU_MSG_EVENT_UPDATE_GRID_DISPLAYLESS_PARAMS: _bindgen_ty_3 = 4136;
+pub const NV_VGPU_MSG_EVENT_PMU_HALTED: _bindgen_ty_3 = 4137;
+pub const NV_VGPU_MSG_EVENT_ECC_POSSIBLE_ERR_FAST_PATH: _bindgen_ty_3 = 4138;
+pub const NV_VGPU_MSG_EVENT_NVLINK_TRAFFIC_QUIESCE_NOTIFY: _bindgen_ty_3 = 4139;
+pub const NV_VGPU_MSG_EVENT_GPU_GFM_STATE_CHANGE: _bindgen_ty_3 = 4140;
+pub const NV_VGPU_MSG_EVENT_NVLINK_ABM_FABRIC_HEALTH_MASK_UPDATE: _bindgen_ty_3 = 4141;
+pub const NV_VGPU_MSG_EVENT_NUM_EVENTS: _bindgen_ty_3 = 4142;
+pub type _bindgen_ty_3 = ffi::c_uint;
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
+    pub totalVFs: u32_,
+    pub firstVfOffset: u32_,
+    pub vfFeatureMask: u32_,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub FirstVFBar0Address: u64_,
+    pub FirstVFBar1Address: u64_,
+    pub FirstVFBar2Address: u64_,
+    pub bar0Size: u64_,
+    pub bar1Size: u64_,
+    pub bar2Size: u64_,
+    pub b64bitBar0: u8_,
+    pub b64bitBar1: u8_,
+    pub b64bitBar2: u8_,
+    pub bSriovEnabled: u8_,
+    pub bSriovHeavyEnabled: u8_,
+    pub bEmulateVFBar0TlbInvalidationRegister: u8_,
+    pub bClientRmAllocatedCtxBuffer: u8_,
+    pub bNonPowerOf2ChannelCountSupported: u8_,
+    pub bVfResizableBAR1Supported: u8_,
+    pub __bindgen_padding_1: [u8; 7usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS {
+    pub BoardID: u32_,
+    pub chipSKU: [ffi::c_char; 9usize],
+    pub chipSKUMod: [ffi::c_char; 5usize],
+    pub __bindgen_padding_0: [u8; 2usize],
+    pub skuConfigVersion: u32_,
+    pub project: [ffi::c_char; 5usize],
+    pub projectSKU: [ffi::c_char; 5usize],
+    pub CDP: [ffi::c_char; 6usize],
+    pub projectSKUMod: [ffi::c_char; 2usize],
+    pub __bindgen_padding_1: [u8; 2usize],
+    pub businessCycle: u32_,
+}
+pub const NV2080_FB_REGION_TAG_NV2080_FB_REGION_TAG_NONE: NV2080_FB_REGION_TAG = 0;
+pub const NV2080_FB_REGION_TAG_NV2080_FB_REGION_TAG_GSP_CARVEOUT: NV2080_FB_REGION_TAG = 1;
+pub const NV2080_FB_REGION_TAG_NV2080_FB_REGION_TAG_CPU_RM_RESERVED: NV2080_FB_REGION_TAG = 2;
+pub const NV2080_FB_REGION_TAG_NV2080_FB_REGION_TAG_CPU_RM_RESERVED_HEAP: NV2080_FB_REGION_TAG = 3;
+pub const NV2080_FB_REGION_TAG_NV2080_FB_REGION_TAG_GSP_RM_RESERVED: NV2080_FB_REGION_TAG = 4;
+pub const NV2080_FB_REGION_TAG_NV2080_FB_REGION_TAG_GSP_RM_RESERVED_HEAP: NV2080_FB_REGION_TAG = 5;
+pub type NV2080_FB_REGION_TAG = ffi::c_uint;
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO {
+    pub base: u64_,
+    pub limit: u64_,
+    pub reserved: u64_,
+    pub performance: u32_,
+    pub supportCompressed: u8_,
+    pub supportISO: u8_,
+    pub bProtected: u8_,
+    pub blackList: [u8_; 18usize],
+    pub __bindgen_padding_0: [u8; 3usize],
+    pub regionTag: NV2080_FB_REGION_TAG,
+}
+impl Default for NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS {
+    pub numFBRegions: u32_,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub fbRegion: [NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO; 16usize],
+}
+impl Default for NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct NV2080_CTRL_GPU_GET_GID_INFO_PARAMS {
+    pub index: u32_,
+    pub flags: u32_,
+    pub length: u32_,
+    pub data: [u8_; 256usize],
+}
+impl Default for NV2080_CTRL_GPU_GET_GID_INFO_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct DOD_METHOD_DATA {
+    pub status: u32_,
+    pub acpiIdListLen: u32_,
+    pub acpiIdList: [u32_; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct JT_METHOD_DATA {
+    pub status: u32_,
+    pub jtCaps: u32_,
+    pub jtRevId: u16_,
+    pub bSBIOSCaps: u8_,
+    pub __bindgen_padding_0: u8,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct MUX_METHOD_DATA_ELEMENT {
+    pub acpiId: u32_,
+    pub mode: u32_,
+    pub status: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct MUX_METHOD_DATA {
+    pub tableLen: u32_,
+    pub acpiIdMuxModeTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+    pub acpiIdMuxPartTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+    pub acpiIdMuxStateTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct CAPS_METHOD_DATA {
+    pub status: u32_,
+    pub optimusCaps: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct ACPI_METHOD_DATA {
+    pub bValid: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+    pub dodMethodData: DOD_METHOD_DATA,
+    pub jtMethodData: JT_METHOD_DATA,
+    pub muxMethodData: MUX_METHOD_DATA,
+    pub capsMethodData: CAPS_METHOD_DATA,
+}
+pub type GspStaticConfigInfo = GspStaticConfigInfo_t;
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct BUSINFO {
+    pub deviceID: u16_,
+    pub vendorID: u16_,
+    pub subdeviceID: u16_,
+    pub subvendorID: u16_,
+    pub revisionID: u8_,
+    pub __bindgen_padding_0: u8,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GSP_VF_INFO {
+    pub totalVFs: u32_,
+    pub firstVFOffset: u32_,
+    pub FirstVFBar0Address: u64_,
+    pub FirstVFBar1Address: u64_,
+    pub FirstVFBar2Address: u64_,
+    pub b64bitBar0: u8_,
+    pub b64bitBar1: u8_,
+    pub b64bitBar2: u8_,
+    pub __bindgen_padding_0: [u8; 5usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GSP_PCIE_CONFIG_REG {
+    pub linkCap: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct EcidManufacturingInfo {
+    pub info: [u64_; 2usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct FW_WPR_LAYOUT_OFFSET {
+    pub nonWprHeapOffset: u64_,
+    pub frtsOffset: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct GspStaticConfigInfo_t {
+    pub gidInfo: NV2080_CTRL_GPU_GET_GID_INFO_PARAMS,
+    pub SKUInfo: NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub fbRegionInfoParams: NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS,
+    pub bPdiValid: u8_,
+    pub __bindgen_padding_1: [u8; 7usize],
+    pub pdi: u64_,
+    pub sriovCaps: NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS,
+    pub sriovMaxGfid: u32_,
+    pub engineCaps: [u32_; 3usize],
+    pub poisonFuseEnabled: u8_,
+    pub __bindgen_padding_2: [u8; 7usize],
+    pub fb_length: u64_,
+    pub gpuNameString: [u8_; 64usize],
+    pub gpuShortNameString: [u8_; 64usize],
+    pub bGpuInternalSku: u8_,
+    pub bIsQuadroGeneric: u8_,
+    pub bIsQuadroAd: u8_,
+    pub bIsNvidiaNvs: u8_,
+    pub bIsVgx: u8_,
+    pub bGeforceSmb: u8_,
+    pub bIsTitan: u8_,
+    pub bIsTesla: u8_,
+    pub bIsMobile: u8_,
+    pub bIsCmpSku: u8_,
+    pub bIsGc6Rtd3Allowed: u8_,
+    pub bIsGc8Rtd3Allowed: u8_,
+    pub bIsGcOffRtd3Allowed: u8_,
+    pub bIsGcoffLegacyAllowed: u8_,
+    pub bIsMigSupported: u8_,
+    pub __bindgen_padding_3: u8,
+    pub RTD3GC6TotalBoardPower: u16_,
+    pub RTD3GC6PerstDelay: u16_,
+    pub __bindgen_padding_4: [u8; 4usize],
+    pub bar1PdeBase: u64_,
+    pub bar2PdeBase: u64_,
+    pub bVbiosValid: u8_,
+    pub __bindgen_padding_5: [u8; 3usize],
+    pub vbiosSubVendor: u32_,
+    pub vbiosSubDevice: u32_,
+    pub vbiosRevision: u32_,
+    pub vbiosOemRevision: u32_,
+    pub bPageRetirementSupported: u8_,
+    pub bSplitVasBetweenServerClientRm: u8_,
+    pub bClRootportNeedsNosnoopWAR: u8_,
+    pub __bindgen_padding_6: u8,
+    pub hInternalClient: u32_,
+    pub hInternalDevice: u32_,
+    pub hInternalSubdevice: u32_,
+    pub bSelfHostedMode: u8_,
+    pub bAtsSupported: u8_,
+    pub bSysL2CacheCoherentMode: u8_,
+    pub bIsGpuUefi: u8_,
+    pub bIsEfiInit: u8_,
+    pub __bindgen_padding_7: [u8; 7usize],
+    pub ecidInfo: EcidManufacturingInfo,
+    pub fwWprLayoutOffset: FW_WPR_LAYOUT_OFFSET,
+    pub bBusResetRequired: u8_,
+    pub chipSubRev: u8_,
+    pub __bindgen_padding_8: [u8; 2usize],
+    pub emulationRev1: u32_,
+}
+impl Default for GspStaticConfigInfo_t {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GspSystemInfo {
+    pub gpuPhysAddr: u64_,
+    pub gpuPhysFbAddr: u64_,
+    pub gpuPhysInstAddr: u64_,
+    pub gpuPhysIoAddr: u64_,
+    pub nvDomainBusDeviceFunc: u64_,
+    pub simAccessBufPhysAddr: u64_,
+    pub notifyOpSharedSurfacePhysAddr: u64_,
+    pub pcieAtomicsOpMask: u64_,
+    pub consoleMemSize: u64_,
+    pub maxUserVa: u64_,
+    pub pciConfigMirrorBase: u32_,
+    pub pciConfigMirrorSize: u32_,
+    pub PCIDeviceID: u32_,
+    pub PCISubDeviceID: u32_,
+    pub PCIRevisionID: u32_,
+    pub pcieAtomicsCplDeviceCapMask: u32_,
+    pub oorArch: u8_,
+    pub bUnstableRpcs: u8_,
+    pub bUnstableEvents: u8_,
+    pub __bindgen_padding_0: [u8; 5usize],
+    pub clPdbProperties: u64_,
+    pub Chipset: u32_,
+    pub bGpuBehindBridge: u8_,
+    pub bFlrSupported: u8_,
+    pub b64bBar0Supported: u8_,
+    pub bMnocAvailable: u8_,
+    pub chipsetL1ssEnable: u32_,
+    pub bUpstreamL0sUnsupported: u8_,
+    pub bUpstreamL1Unsupported: u8_,
+    pub bUpstreamL1PorSupported: u8_,
+    pub bUpstreamL1PorMobileOnly: u8_,
+    pub bSystemHasMux: u8_,
+    pub upstreamAddressValid: u8_,
+    pub FHBBusInfo: BUSINFO,
+    pub chipsetIDInfo: BUSINFO,
+    pub __bindgen_padding_1: [u8; 2usize],
+    pub acpiMethodData: ACPI_METHOD_DATA,
+    pub hypervisorType: u32_,
+    pub virtualConfigBits: u16_,
+    pub bIsPassthru: u8_,
+    pub __bindgen_padding_2: [u8; 5usize],
+    pub sysTimerOffsetNs: u64_,
+    pub gspVFInfo: GSP_VF_INFO,
+    pub bIsPrimary: u8_,
+    pub bIsUnixHdmiFrlComplianceEnabled: u8_,
+    pub isGridBuild: u8_,
+    pub __bindgen_padding_3: u8,
+    pub pcieConfigReg: GSP_PCIE_CONFIG_REG,
+    pub gridBuildCsp: u32_,
+    pub bPreserveVideoMemoryAllocations: u8_,
+    pub bTdrEventSupported: u8_,
+    pub bFeatureStretchVblankCapable: u8_,
+    pub bEnableDynamicGranularityPageArrays: u8_,
+    pub bClockBoostSupported: u8_,
+    pub __bindgen_padding_4: [u8; 7usize],
+    pub hostPageSize: u64_,
+    pub bIsCmcBasedHws: u8_,
+    pub bGspNocatEnabled: u8_,
+    pub bS0ixSupport: u8_,
+    pub bWindowChannelAlwaysMapped: u8_,
+    pub pciePowerControlValue: u32_,
+    pub bPciePowerControlPresent: u8_,
+    pub __bindgen_padding_5: [u8; 3usize],
+    pub pf0DeviceControl2Reg: u32_,
+    pub bIsCxlDevice: u8_,
+    pub bReserveZeroFbAddressAsRegion: u8_,
+    pub __bindgen_padding_6: [u8; 6usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
+    pub flags: u64_,
+    pub sharedMemPhysAddr: u64_,
+    pub cmdQueueOffset: u64_,
+    pub statQueueOffset: u64_,
+    pub queueElementHdrSize: u32_,
+    pub queueElementSizeMin: u32_,
+    pub queueElementSizeMax: u32_,
+    pub queueHeaderAlign: u32_,
+    pub queueElementAlign: u32_,
+    pub pageTableEntryCount: u32_,
+    pub reserved: [u8_; 8usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GSP_SR_INIT_ARGUMENTS {
+    pub oldLevel: u32_,
+    pub flags: u32_,
+    pub reserved: [u8_; 8usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GSP_ARGUMENTS_CACHED {
+    pub magic: u32_,
+    pub size: u16_,
+    pub reserved: [u8_; 2usize],
+    pub flags: u64_,
+    pub messageQueueInitArguments: MESSAGE_QUEUE_INIT_ARGUMENTS,
+    pub srInitArguments: GSP_SR_INIT_ARGUMENTS,
+    pub reserved2: [u8_; 4usize],
+    pub gpuInstance: u32_,
+    pub profilerArgs: GSP_ARGUMENTS_CACHED__bindgen_ty_1,
+    pub sysmemHeapArgs: GSP_ARGUMENTS_CACHED__bindgen_ty_2,
+    pub rmStateMonitorBufferArgs: GSP_ARGUMENTS_CACHED__bindgen_ty_3,
+    pub bindataArgs: GSP_ARGUMENTS_CACHED__bindgen_ty_4,
+    pub vbiosOverrideArgs: GSP_ARGUMENTS_CACHED__bindgen_ty_5,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GSP_ARGUMENTS_CACHED__bindgen_ty_1 {
+    pub pa: u64_,
+    pub size: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GSP_ARGUMENTS_CACHED__bindgen_ty_2 {
+    pub pa: u64_,
+    pub size: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GSP_ARGUMENTS_CACHED__bindgen_ty_3 {
+    pub pa: u64_,
+    pub size: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GSP_ARGUMENTS_CACHED__bindgen_ty_4 {
+    pub radix3: u64_,
+    pub size: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GSP_ARGUMENTS_CACHED__bindgen_ty_5 {
+    pub pa: u64_,
+    pub size: u64_,
+}
+#[repr(C)]
+#[derive(Copy, Clone, MaybeZeroable)]
+pub union rpc_message_rpc_union_field_v03_00 {
+    pub spare: u32_,
+    pub cpuRmGfid: u32_,
+}
+impl Default for rpc_message_rpc_union_field_v03_00 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+pub type rpc_message_rpc_union_field_v = rpc_message_rpc_union_field_v03_00;
+#[repr(C)]
+#[derive(MaybeZeroable)]
+pub struct rpc_message_header_v03_00 {
+    pub header_version: u32_,
+    pub signature: u32_,
+    pub length: u32_,
+    pub function: u32_,
+    pub rpc_result: u32_,
+    pub rpc_result_private: u32_,
+    pub sequence: u32_,
+    pub u: rpc_message_rpc_union_field_v,
+    pub rpc_message_data: __IncompleteArrayField<u8_>,
+}
+impl Default for rpc_message_header_v03_00 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+pub type rpc_message_header_v = rpc_message_header_v03_00;
+#[repr(C)]
+#[derive(Copy, Clone, MaybeZeroable)]
+pub struct GspFwWprMeta {
+    pub magic: u64_,
+    pub revision: u64_,
+    pub sysmemAddrOfRadix3Elf: u64_,
+    pub sizeOfRadix3Elf: u64_,
+    pub sysmemAddrOfBootloader: u64_,
+    pub sizeOfBootloader: u64_,
+    pub bootloaderCodeOffset: u64_,
+    pub bootloaderDataOffset: u64_,
+    pub bootloaderManifestOffset: u64_,
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1,
+    pub gspFwRsvdStart: u64_,
+    pub nonWprHeapOffset: u64_,
+    pub nonWprHeapSize: u64_,
+    pub gspFwWprStart: u64_,
+    pub gspFwHeapOffset: u64_,
+    pub gspFwHeapSize: u64_,
+    pub gspFwOffset: u64_,
+    pub bootBinOffset: u64_,
+    pub frtsOffset: u64_,
+    pub frtsSize: u64_,
+    pub gspFwWprEnd: u64_,
+    pub fbSize: u64_,
+    pub vgaWorkspaceOffset: u64_,
+    pub vgaWorkspaceSize: u64_,
+    pub bootCount: u64_,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2,
+    pub gspFwHeapVfPartitionCount: u8_,
+    pub flags: u8_,
+    pub pagingConfig: u16_,
+    pub pmuReservedSize: u32_,
+    pub verified: u64_,
+}
+#[repr(C)]
+#[derive(Copy, Clone, MaybeZeroable)]
+pub union GspFwWprMeta__bindgen_ty_1 {
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1__bindgen_ty_1,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_1__bindgen_ty_2,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_1 {
+    pub sysmemAddrOfSignature: u64_,
+    pub sizeOfSignature: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_2 {
+    pub gspFwHeapFreeListWprOffset: u32_,
+    pub unused0: u32_,
+    pub unused1: u64_,
+}
+impl Default for GspFwWprMeta__bindgen_ty_1 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Copy, Clone, MaybeZeroable)]
+pub union GspFwWprMeta__bindgen_ty_2 {
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_2__bindgen_ty_1,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2__bindgen_ty_2,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
+    pub partitionRpcAddr: u64_,
+    pub partitionRpcRequestOffset: u16_,
+    pub partitionRpcReplyOffset: u16_,
+    pub elfCodeOffset: u32_,
+    pub elfDataOffset: u32_,
+    pub elfCodeSize: u32_,
+    pub elfDataSize: u32_,
+    pub lsUcodeVersion: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_2 {
+    pub partitionRpcPadding: [u32_; 4usize],
+    pub sysmemAddrOfCrashReportQueue: u64_,
+    pub sizeOfCrashReportQueue: u32_,
+    pub lsUcodeVersionPadding: [u32_; 1usize],
+}
+impl Default for GspFwWprMeta__bindgen_ty_2 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+impl Default for GspFwWprMeta {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+pub type LibosAddress = u64_;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_NONE: LibosMemoryRegionKind = 0;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS: LibosMemoryRegionKind = 1;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_RADIX3: LibosMemoryRegionKind = 2;
+pub type LibosMemoryRegionKind = ffi::c_uint;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_NONE: LibosMemoryRegionLoc = 0;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM: LibosMemoryRegionLoc = 1;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_FB: LibosMemoryRegionLoc = 2;
+pub type LibosMemoryRegionLoc = ffi::c_uint;
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct LibosMemoryRegionInitArgument {
+    pub id8: LibosAddress,
+    pub pa: LibosAddress,
+    pub size: LibosAddress,
+    pub kind: u8_,
+    pub loc: u8_,
+    pub __bindgen_padding_0: [u8; 6usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct PACKED_REGISTRY_ENTRY {
+    pub nameOffset: u32_,
+    pub type_: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+    pub data: u32_,
+    pub length: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, MaybeZeroable)]
+pub struct PACKED_REGISTRY_TABLE {
+    pub size: u32_,
+    pub numEntries: u32_,
+    pub entries: __IncompleteArrayField<PACKED_REGISTRY_ENTRY>,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct msgqTxHeader {
+    pub versionMajor: u16_,
+    pub versionMinor: u16_,
+    pub size: u32_,
+    pub msgSize: u32_,
+    pub msgCount: u32_,
+    pub entryOff: u32_,
+    pub reserved: [u32_; 3usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GSP_MSG_QUEUE_ENCRYPTION_TAG {
+    pub authTagBuffer: [u8_; 16usize],
+}
+#[repr(C)]
+#[derive(MaybeZeroable)]
+pub struct GSP_MSG_QUEUE_ELEMENT {
+    pub mctpMagic: u32_,
+    pub mctpPayloadSize: u32_,
+    pub mctpHeader: u32_,
+    pub nvdmHeader: u32_,
+    pub __bindgen_anon_1: GSP_MSG_QUEUE_ELEMENT__bindgen_ty_1,
+}
+#[repr(C)]
+#[derive(MaybeZeroable)]
+pub struct GSP_MSG_QUEUE_ELEMENT__bindgen_ty_1 {
+    pub withEncryption: __BindgenUnionField<GSP_MSG_QUEUE_ELEMENT__bindgen_ty_1__bindgen_ty_1>,
+    pub noEncryption: __BindgenUnionField<GSP_MSG_QUEUE_ELEMENT__bindgen_ty_1__bindgen_ty_2>,
+    pub bindgen_union_field: [u32; 6usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, MaybeZeroable)]
+pub struct GSP_MSG_QUEUE_ELEMENT__bindgen_ty_1__bindgen_ty_1 {
+    pub encryptionTag: GSP_MSG_QUEUE_ENCRYPTION_TAG,
+    pub nvdmPayloadSize: u32_,
+    pub reserved: u32_,
+    pub payload: __IncompleteArrayField<u8_>,
+}
+#[repr(C)]
+#[derive(Debug, Default, MaybeZeroable)]
+pub struct GSP_MSG_QUEUE_ELEMENT__bindgen_ty_1__bindgen_ty_2 {
+    pub nvdmPayloadSize: u32_,
+    pub reserved: u32_,
+    pub payload: __IncompleteArrayField<u8_>,
+}
+impl Default for GSP_MSG_QUEUE_ELEMENT__bindgen_ty_1 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+impl Default for GSP_MSG_QUEUE_ELEMENT {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(MaybeZeroable)]
+pub struct GMCAPI_HEADER {
+    pub command: u32_,
+    pub size: u32_,
+    pub sequence: u64_,
+    pub __bindgen_anon_1: GMCAPI_HEADER__bindgen_ty_1,
+    pub reserved: [u32_; 5usize],
+    pub data: __IncompleteArrayField<u8_>,
+}
+#[repr(C)]
+#[derive(Copy, Clone, MaybeZeroable)]
+pub union GMCAPI_HEADER__bindgen_ty_1 {
+    pub request: GMCAPI_HEADER__bindgen_ty_1__bindgen_ty_1,
+    pub response: GMCAPI_HEADER__bindgen_ty_1__bindgen_ty_2,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GMCAPI_HEADER__bindgen_ty_1__bindgen_ty_1 {
+    pub max_response_size: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GMCAPI_HEADER__bindgen_ty_1__bindgen_ty_2 {
+    pub status: u32_,
+}
+impl Default for GMCAPI_HEADER__bindgen_ty_1 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+impl Default for GMCAPI_HEADER {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_RESERVED_LAST: GMCAPI_COMMANDS = 65535;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_GSP_INIT: GMCAPI_COMMANDS = 65537;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER: GMCAPI_COMMANDS = 65538;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_HS_BINARY: GMCAPI_COMMANDS = 65539;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_GSP_SUSPEND: GMCAPI_COMMANDS = 65540;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_GSP_RESUME_DONE: GMCAPI_COMMANDS = 65541;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_ADD_VGPU_TYPE: GMCAPI_COMMANDS = 131073;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_SUPPORTED_VGPU_TYPES: GMCAPI_COMMANDS = 131074;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_CREATABLE_VGPU_TYPES: GMCAPI_COMMANDS = 131075;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_ASSIGN_VGPU_TYPE: GMCAPI_COMMANDS = 131076;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_DEASSIGN_VGPU_TYPE: GMCAPI_COMMANDS = 131077;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_VGPU_PROPERTIES: GMCAPI_COMMANDS = 131078;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE: GMCAPI_COMMANDS = 131079;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK: GMCAPI_COMMANDS = 131104;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK: GMCAPI_COMMANDS = 131105;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE: GMCAPI_COMMANDS =
+    131106;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES: GMCAPI_COMMANDS = 131107;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_PLUGIN_TRIGGERED_EVENT: GMCAPI_COMMANDS = 131108;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_SCRUB_GUEST_FB: GMCAPI_COMMANDS = 131109;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_ALLOC_GSP_CEUTILS: GMCAPI_COMMANDS = 131110;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_FREE_GSP_CEUTILS: GMCAPI_COMMANDS = 131111;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_SCHED_CONTROL: GMCAPI_COMMANDS = 196609;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_MMU_FAULT_QUEUED: GMCAPI_COMMANDS = 262145;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_INVALID: GMCAPI_COMMANDS = 4294967295;
+pub type GMCAPI_COMMANDS = ffi::c_uint;
+pub const GSP_DMA_TARGET_GSP_DMA_TARGET_LOCAL_FB: GSP_DMA_TARGET = 0;
+pub const GSP_DMA_TARGET_GSP_DMA_TARGET_COHERENT_SYSTEM: GSP_DMA_TARGET = 1;
+pub const GSP_DMA_TARGET_GSP_DMA_TARGET_NONCOHERENT_SYSTEM: GSP_DMA_TARGET = 2;
+pub const GSP_DMA_TARGET_GSP_DMA_TARGET_COUNT: GSP_DMA_TARGET = 3;
+pub type GSP_DMA_TARGET = ffi::c_uint;
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GSP_FMC_INIT_PARAMS {
+    pub regkeys: u32_,
+    pub reserved: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct GSP_ACR_BOOT_GSP_RM_PARAMS {
+    pub target: GSP_DMA_TARGET,
+    pub gspRmDescSize: u32_,
+    pub gspRmDescOffset: u64_,
+    pub wprCarveoutOffset: u64_,
+    pub wprCarveoutSize: u32_,
+    pub bIsGspRmBoot: u8_,
+    pub bInstInSysMode: u8_,
+    pub bIcuEnabled: u8_,
+    pub bScrubCbcSr: u8_,
+}
+impl Default for GSP_ACR_BOOT_GSP_RM_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct GSP_RM_PARAMS {
+    pub target: GSP_DMA_TARGET,
+    pub reserved: u32_,
+    pub bootArgsOffset: u64_,
+}
+impl Default for GSP_RM_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct GSP_SPDM_PARAMS {
+    pub target: GSP_DMA_TARGET,
+    pub payloadBufferSize: u32_,
+    pub payloadBufferOffset: u64_,
+}
+impl Default for GSP_SPDM_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GSP_RM_MEM_PARAMS {
+    pub flushSysmemAddrValLo: u32_,
+    pub flushSysmemAddrValHi: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct GSP_FMC_BOOT_PARAMS {
+    pub magic: u32_,
+    pub size: u16_,
+    pub reserved0: u16_,
+    pub reserved1: [u64_; 3usize],
+    pub initParams: GSP_FMC_INIT_PARAMS,
+    pub reserved2: [u64_; 3usize],
+    pub bootGspRmParams: GSP_ACR_BOOT_GSP_RM_PARAMS,
+    pub reserved3: [u64_; 4usize],
+    pub gspRmParams: GSP_RM_PARAMS,
+    pub reserved4: [u64_; 2usize],
+    pub gspSpdmParams: GSP_SPDM_PARAMS,
+    pub reserved5: [u64_; 2usize],
+    pub gspRmMemParams: GSP_RM_MEM_PARAMS,
+    pub reserved6: [u64_; 7usize],
+}
+impl Default for GSP_FMC_BOOT_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct rpc_unloading_guest_driver_v1F_07 {
+    pub bInPMTransition: u8_,
+    pub bGc6Entering: u8_,
+    pub __bindgen_padding_0: [u8; 2usize],
+    pub newLevel: u32_,
+}
-- 
2.55.0

