Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2F13546E9
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370510; cv=fail; b=a6wZhdlNkOiNgDDfz5UOlf3E7xjyoL/oh/8NoTMhOHYfF+CNrkfTpGUT4E5AfnoAHmUpbsiXV+kABZz7bjZcg8wmy/FQFhN+XE8wJDJi5aK/VDcaWvEJzJwh2r1qj2bySttRvDhkw/yQBcBiGPyf4LV+2mPkF50hBwDq4nFPlsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370510; c=relaxed/simple;
	bh=9mSzkWFWvmUicyY4QD2pH0UnS+9pTowoVCeFSi+NYJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cLIHpYpZFLuWPKF15iJVdsS5ATkEIRN9gHglvV41cz095kJAXyiGk4JdKp5utZcMSzP/eFFC9UwkOFztt2XkMFvJZ13InZcYvru26vRM6w3hRJYlqeH9FDI4wahGmj4QBune8Szxt8vJ/nQrjvlQFVHG0qRyh40UsLpmIhi4be4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YlXmrqrp; arc=fail smtp.client-ip=52.101.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YlXmrqrp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urnn0oRvNhOv2203jrinmR8C4nI5G25ZALaXbw20xm0UoxWENvLSnJq/08HuIFU3+b0O6W/9U5mx3UBjzdKUtLPYxtCCzV2MEMbF0v0eVQKK4TVeyd8NvzBZXQgacU3AIu0v252lkAo6SKY1juFnBhyRwvKp3ScxFqmsScd2+OzcUIuaXrJtIeoHjf+8/yc4v9HdYvjm0pYEseXPTUl5TmnVlMdeU2QEPGXUn1Bzxb4zr3Zb8xPwTvyb5tZnlF/3hrQzxHeYrn2lK7EvhyFKPwdHEHp8bTspzXlWvUxGXl4V0OZc96lFQFWDVCWUSbhAn1j7IaDGjuH07DzuiG7jgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Nh1vr437RJ1KLh6Bv0uFv1R0TiF0hf4aTzeTYyv/Hs=;
 b=NxV9aH9f+gP51LbF+Tbyejj1Nbgo4FoS2JHU8cSwHP/PfYQnTLLseWybHG6W8b0ngjIOTs8ba6wdg3LUxNXiW7zCpgSAgkJONbx2EysY6lw6Qvw9HNqpJcNddxD2kUWFbcYO0vrswf44SkhnYRGrJnPfgQp7w+b1Ax+oheIW/Iv17SyJ5yI1oRn6QTskquAs5UiRPdI/H4FJjsfyaENqQ9ClEuxzVGTw2dlJ6F5JTJ8Ccsr47xJb/8gMjFA/sarEBMPI/+s9L69ylVz3GdkbQElBmVS7fVU8/Q4Km5iQD/gItM2kB/6Y0xTp8TrCvgdEDJEpN1gLAvoz04KJWHE9bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Nh1vr437RJ1KLh6Bv0uFv1R0TiF0hf4aTzeTYyv/Hs=;
 b=YlXmrqrpluBEkfWqMveylnsRm0kr39/xBlyzbIGSfO6p6ArPHBfHpgQ1XcKPe3M0XegZVyDWE/prdQYcrRHa7JcVqJr8gYr9XW32SNf0tSfFuoC2g7gHDiXsNNhJbrpvS/7idbD4UA/iRmqk7zWwT3MI6zYbFHwxZSnRkV2iWgMyMPbqX3JBwLt25vDenmQ50I9ChBHNV0iHjlYxIHYkVv3PjHOqRf004YKMuo70zqogtLYKkGjuh3XMw4d2N690rril2ShOpHIjGrVQ4Hqe8kokuHLIzX8P5kM8UA/sq+uq6AsS3Amo84HQSzWVMJw1Wm1qNB5C1ejdx2hRchx3Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:26 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:26 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
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
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v12 10/22] gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
Date: Mon,  1 Jun 2026 20:20:58 -0700
Message-ID: <20260602032111.224790-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:a03:333::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab792b6-29c6-4f8d-defe-08dec056078c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	5nmSBIWa5pD+RpdZDUgQYWmOUqcOzPG1BFWLKNvxfO8E9RJVA29sLX3xtz/qePDYXvPu+rXN1esSgrzHx5TE+xEtx6mbheSxUx3Sso0rklvUfgb/RT/y2MsPexvsY7+ypM30+7Mhj5a61twAgKjYhvUF2FUIsrI3Fn/v59GgJkrU6J5txO32vApqhluwJJmh1T2XQowFUXYOpRmdnfkdHsSm37vIzSzwH8nZD7sN1hMkEuXto3CzKauucpGT3JB8DNR+eeFr1301mnfx00cQ9/+wUJeQSimE+3XU9NQZE24yGlScpbeVD8gcWjWBZFbD4VwFpTAZ6y2av7Lb8Jk2/0SaNcOiLH/NFGfH4CD7D24cU+i8RitWq/EBPZvaKPjzxeX69s60frUUBAwtRuJ4+RUYXCFKa+iRS42KNFtR3twZULJ/XcuvMspfhMT0NX/ZSuA9hBW05B0Y/gSwutiri5ga9ZZqUPPPrKDkyOmn3iaunmOklemGhJANra2o1wSoAFOVp63DWQg6HkVb9P0o+53M9XEETzGpFdjrC6sw6OOKsvnLc6iKEqsGbneMgboX+osfBBJ07KnOQvDNt7drmyQ/ezcXPlk5mrSSBOZjGVc9WtP/EGD0IkypUSXSu5UJvb6eNFq/7UQ3ad84EV8gNweiMU1mBiOC/g6bWpY/g4zID/xKXZQgzs+vqWaT18Zj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ukcLx3NP3dO3za3fBw2iisaB5lEPQiAeod2VKr3zAR9FSCBSPg9KzySEh9Iv?=
 =?us-ascii?Q?bdU+bQgT+vB7jSnUnXpvDvWO3oXFk5gYY/Tabq8p92CXyTwPf+WPpUM5pSYe?=
 =?us-ascii?Q?JqjYz29rKd/WhNOkn/fM2aVXPc75F3dcDMcXdsWaA01CqIDqh9y27c5S8eoH?=
 =?us-ascii?Q?LjOuW/fDPDpIaJiyjjKPnpyD6i9vNxdYEvfFxTyqjT0JD1tpDPPVnIZJZQi8?=
 =?us-ascii?Q?ZrWePKsUsy1DRrWcItLlRm/59UyUyxy/WVPLb0iI9Pz0MOl33wGrYwfq76kd?=
 =?us-ascii?Q?tmnjl6ltwzX3eocLpi3/i+fAsojILfE2E2eYgG3eM6Iz87TTDwZP8GYZkfiB?=
 =?us-ascii?Q?zQA2XyHr35WjuKAXfTfdsT0+Cwd2XQvinT/YaccmRhbwEEVBAfR9goNvsXt4?=
 =?us-ascii?Q?q8sXisE8UFBkCbOsg5sUCcatEZjXHsfl1PlyzTVmDRLOIgqYQ1CcV69j6TKK?=
 =?us-ascii?Q?XSeg0gquIjCdSElHkwrM/EdIfmWLVcFAzci9Qjr4EBUmA1HjGVkaOs0LPycT?=
 =?us-ascii?Q?0pXdCVfOFGLhBL9ECHfq9TrB3Pd8pOBPdPAoyrCCskf+aTzjgbiPU/bSVcol?=
 =?us-ascii?Q?ywdW6MyaaY6tjabTnzhpZZi8+JHDz+vcA3O1wYXOkHcEKkAEp3W+mJjHP+Ex?=
 =?us-ascii?Q?Mhtzu0Mbvtwj0SqpGS42EI3hyiQhDo6m6ko0FA8xw140Z1kksv6I1Ix9L5fo?=
 =?us-ascii?Q?p05z4q2AULiqSG4Z+CqDkSNVgSgtc3yNWjyuelkTdNBq+hPig/E/YDTEYDVT?=
 =?us-ascii?Q?RuZN9eWpw8NQqqdpX7TY2i5hvordTcItOTOh8uZeAwHI38THkethHpgq94DH?=
 =?us-ascii?Q?pAVM2LMUS7HYq5aWrZpclsnxqzROv6t0ZtAOJC89o3dk6V/bOi6r68TJWFqL?=
 =?us-ascii?Q?fwF1vIjfvMVNySLp4RpnTXgg641a+1c9ViHdPMF7zdTxCKTx66hl8tYwpAyy?=
 =?us-ascii?Q?0gxDvvwY0sopULdxH1C/Csdl3b1qljWL8KlD7sbWka9uf/avICH5hLlrVtQO?=
 =?us-ascii?Q?tUjE6eLNNfPi/+cYpW/LGwBP0HHzT4ay7h02tnhNEiGnfcSfYipHyVHs5ZMM?=
 =?us-ascii?Q?lEJ2oxShxJJRxs4hEgMFsfPLwYuVf0PFkIXbDnhwjsVhs10PH+f0YeNlbdb0?=
 =?us-ascii?Q?28GfTTdM7WIUQiQFH/9zP5xzMBpl872bH4no6N4TK+47GU7T5YYbGjA0KWXd?=
 =?us-ascii?Q?XXJGiQn1nMVBnGeoMwcPKovfwQaJhhawKL4cBIyuEY02POfCxucFjW56/Ia/?=
 =?us-ascii?Q?g5K5Yy2U77kuc8h6tkpEQDY7OO8uOk+LWzOnvruDFzBFDJB0EObOhIqXpP/W?=
 =?us-ascii?Q?YZZAw7PoFVg6K5rmhQxj0/33YjQZE9/n4FL3e153WmJS4DpQ/fAnJiy30F1b?=
 =?us-ascii?Q?QGFdJSaHCdbq5Mbt8Rd0WoIAwREbha3yawnCNaiiSVbK74vg6ZypOYVXP6By?=
 =?us-ascii?Q?IbbrTSEVmABhoQZuOr6HJUlbaWX1gEpicBNqvs2AOfiDBRgLmQaGC47fZDUF?=
 =?us-ascii?Q?Mnmi1bcDi1+oxhm7IRWYOOCCkUXir+dQhG2RGqX257QQYfYw9V8OZg1w5c7z?=
 =?us-ascii?Q?+7XArQjkfgKOYANe3myP6IIHXdAygS2CO9KFpEVncNgmWufrjFtvmhW7O90v?=
 =?us-ascii?Q?mFWI+RKsHhuCi/WCkegMipS2VDc3ndFFGI1lI0jmt71RlaLlHSKaGptq5r9x?=
 =?us-ascii?Q?RxgFZQvVfgmeY0zMLVgGKzXEqImBd3BTrGEm1kLuWeSLQB43G2uxjQ+YhU6d?=
 =?us-ascii?Q?8UHdIpQnIw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab792b6-29c6-4f8d-defe-08dec056078c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:26.1100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wFcz/sD9rC8CDn6nTQ9gOmsW+TtY1O983GnREmt2emjEli+v14xEt4LcuyOUrheacFHYrJ0bcRleL0yWQolgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565

Add the FSP (Foundation Security Processor) falcon engine type that
will handle secure boot and Chain of Trust operations on Hopper and
Blackwell architectures.

The FSP falcon replaces SEC2's role in the boot sequence for these newer
architectures. This initial stub just defines the falcon type and its
base address.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs     |  1 +
 drivers/gpu/nova-core/falcon/fsp.rs | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 24cc2c26e28d..053ce5bea6cd 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -40,6 +40,7 @@
     regs,
 };
 
+pub(crate) mod fsp;
 pub(crate) mod gsp;
 mod hal;
 pub(crate) mod sec2;
diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
new file mode 100644
index 000000000000..c4a9ce8a47f8
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! FSP (Foundation Security Processor) falcon engine for Hopper/Blackwell GPUs.
+//!
+//! The FSP falcon handles secure boot and Chain of Trust operations
+//! on Hopper and Blackwell architectures, replacing SEC2's role.
+
+use kernel::io::register::RegisterBase;
+
+use crate::falcon::{
+    FalconEngine,
+    PFalcon2Base,
+    PFalconBase, //
+};
+
+/// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
+#[expect(dead_code)]
+pub(crate) struct Fsp(());
+
+impl RegisterBase<PFalconBase> for Fsp {
+    const BASE: usize = 0x8f2000;
+}
+
+impl RegisterBase<PFalcon2Base> for Fsp {
+    const BASE: usize = 0x8f3000;
+}
+
+impl FalconEngine for Fsp {}
-- 
2.54.0

