Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011016.outbound.protection.outlook.com [52.101.57.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352EE3E5A01
	for <nova-gpu@lists.linux.dev>; Thu,  9 Jul 2026 08:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587142; cv=fail; b=Qsf0LJGMHtrXrru9gSwHzQQWv2a+fB3lMgTou0tG7qd4586G1FHFLyoJXHgodnC3CGRMk+xLq09YYhKSmr1frZLMkpva8rX7IaOaAp7R5WntCy+tUWs1N6Az9VgZ/eejmSjeaYw2dRM2LL52LoWFXZyi5bV2DfQmZdHToliPlk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587142; c=relaxed/simple;
	bh=OZUu1/srpPreVqUEoCHY7jXh4GuNGu1fHAdFxiqhhpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uYhezVQUQZdJPMA+SewWiVifipF8gCwtiyATaO/AJ+daXbYRiRCfPA3C9u+ItQki/wR8vb3PZw4b0f0R5itW3xC6OrDP2YXPRQaYmH6sCEt1Q8+sEvXTO79ArmqPYuSrhcI+kW03jDvUOLneHPLpVIgz1juWtX411X1CoD7Ju/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fZmsdAcY; arc=fail smtp.client-ip=52.101.57.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fZmsdAcY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtG4VqpGKeUHUGJEDu6Np1xoq8XXN4HYHi2BYX/yX/mnFfL3Crq8sXJ44x7KflNvkG/syzImRyaH4BborWruLWNQtFOIjAf6CnWt+S0EzFAX/ZU/U5jmZ/CIhYJmulbwV/zem5ykyZiD1xLTywbXm+0Eoz4R/I4u0VAM9ec1/649jrFavb8Qv91kXC2U1yd/DOMR2cgyeXffLOmhW9SGMrrFv5v98r5msTzK1ITEGWoweCOrbdaRTNl541uSqV9pJ/VAE+A3nJTXcWd9ZPbjLuHQ/EtRMm7J54op1CuUGu0zzxO8EUEluqWKyNwaAZbGYeMdguK3E5vJLh2H1AeHOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxZElnw/M7590bxOVYvAXnKBI4lsPwcKJMsO5Bczugk=;
 b=lw1GUqGuBKZqh27dlJnzbbvXHLA2FWG6bDraw1XNwUjXjkW6hvJ5HmNJ9ZpXlsmMlWNs20JE+o2lnyIqct+CxNfAGK71fWnQjjViUNd53dc2fqWBEmqM7t13cA++6M74ca2PZeXFvxe1IG8ouygDDj5d9ZC7n+S0BnrhTI3W4lbtIxY+YTyuRUAFPjfk/EmeMB6j2pgNA3vu9GJQ/KRI+dNBdhiM9rszQXoMqVscbsKRtng1Aovt27uAmn3+/L3WTPEnYpEZISwBhV6s54xfUKliiz1gm3AEDz4iN93fpTnUha9KGhotUPpn2f5Ao8jlASFqBelUTzWQhpSMGP+e6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxZElnw/M7590bxOVYvAXnKBI4lsPwcKJMsO5Bczugk=;
 b=fZmsdAcY+zVyaeGjtKe14uIseLkGzTcf4TDWzukDkFNAn2MDXh7cm4F8cm+iCKXL0vYbYQHDW7Vo+5P2JLROaA8PGCHd71Xr+l2B4TRhtjCPE1mu9R2hqba/wXVwNUkyi40zpNk/72WI6mD1N7CtVc2gOW885y1WpQiHVQ7PZlxNgaP5sg1ZT6ApnaltvwB+n4iTfLVBe8GolI558IPrCAaZZfZTy9ETdzWF0Y61qty3XjTTTbs0CDVMOpDH26wWauH7W+KjAvp37V+KpUWVOIkZ3OeTDXjvTkZklJm9fgqqZxWoXeq0ZVfjklscqC/VhtzNJf6EP6m1Id5FhoIuqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DSVPR12MB999283.namprd12.prod.outlook.com (2603:10b6:8:41c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.15; Thu, 9 Jul 2026 08:52:17 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::5807:8e24:69b0:f6c0]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::5807:8e24:69b0:f6c0%4]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 08:52:17 +0000
From: Alistair Popple <apopple@nvidia.com>
To: nova-gpu@lists.linux.dev
Cc: Alistair Popple <apopple@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Eliot Courtney <ecourtney@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 1/5] gpu: nova-core: Add public driver API to nova-core
Date: Thu,  9 Jul 2026 18:52:00 +1000
Message-ID: <20260709085204.565159-2-apopple@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709085204.565159-1-apopple@nvidia.com>
References: <20260709085204.565159-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0060.ausprd01.prod.outlook.com
 (2603:10c6:10:1fc::19) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DSVPR12MB999283:EE_
X-MS-Office365-Filtering-Correlation-Id: b19dc6c9-b753-4623-ffd4-08dedd976149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|11063799006|56012099006|11062099010|18002099003|22082099003|6133799003|7136999003;
X-Microsoft-Antispam-Message-Info:
	SBf5hahTKdETo8Vwx6WTum4257zhjlQfXaaVsdqgA0cZ9nic59eEIxakpNwywiafGt3bkPsldIoJEO48BPYIbbbLTE6sQY7bz2Fi2VGKaE8zIZyfq5IotoDcyDw9mQNmS+ONFv9Ksl6cLjQyUzppAFuivnhO3EIuMDg1w/N1n5PqHEpltp1PMRuASvflOZZSP0RB0A9ocNrNo8RxnWUC1s33bJsPAPoENDkDrqyJNH6SN5MgxfRmk/CntS67EjnftzBA9HrqdM91nZgJdyJcANgG+9jG8uxmJ3PcygFCPqoTYoNMcVfqM5DmmcgP5rFnj9wQcKTrKMNFU8CDqj0WaygubGqbD36EKyLodQAFa5U7ADi/xz/OonIPoaz8LmSUqYURgRW8RWhupNTzVUeWlsAJmWool5QGW/KueYzBgZCw/HConsdgKXSiM9lYu8XznIGlIrGQEZsUYtnhXXiBi9e7x97pEEDcspn99J8dJoZXZY1Yrd4z6grjFuZLvkYjH2ki6CEnSQGAgow3LT1+VLl79DRW976dKrpSRhNzR1VI+WGflj10Hp/d0b1lE5DyzBinmyXOAyt28i4rzk3RstpPGSh3l1UfNfMvgAe+/bKrsDYz6dbWlSf1hIHJu2bTbshBGhK7crGGxJn331aem6GuF2BiIID5w4ZFKmt9GPs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(56012099006)(11062099010)(18002099003)(22082099003)(6133799003)(7136999003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KSc411BmRK5+aL+aNJwdMjtzkG1Gf9uOPVVfgxfM584XLmgPiV3JPkvp+Mq7?=
 =?us-ascii?Q?i8Vnb1z2QRwrZeOPL6xVemSPvdxntvLuRgJrKbBVGvGuURoY9WXJWROvfrFi?=
 =?us-ascii?Q?Ypys4NxviMhEdVTRUUz7uk5O6iEZmNgLjmhxwN1FTcweps7uZDUoapV8BI/7?=
 =?us-ascii?Q?E6TuACxWyKN9K0W6LS59F1oijAyCkomOUZHExj7fWpHBuCwdfoWCQaaU1fB3?=
 =?us-ascii?Q?1Hc6014ceVGhZpXYFM8cx1MhkfL29sXSfygPuvyzlCLERWKJJwdqYC3ClPtz?=
 =?us-ascii?Q?aaiw/Zs1JHiyGNut2ADxB7tqIFwRBblTIpaJJ5/jLP/JNlvIbGp6dLRBQXAm?=
 =?us-ascii?Q?A4XY4AsE5LcpTKHUhQApgWlvOkBuuQIi16RQiVMMI60jlj8zYRYnNgy3AmzF?=
 =?us-ascii?Q?jAUxB5Pd5aWcSH8r/E8f0bYZeLsS1EGhE1Qmfd4r+LDPc1zHpXeCgxDhGgq5?=
 =?us-ascii?Q?MqupMSZTbfZ0ve8895vXRAuqRf+dESptp9W2f5P3G52BofkNxgR4EcyW1tw3?=
 =?us-ascii?Q?weGa8rJk0WoQAB/KMo42dhMihF0t5HasVODdDui4DRei9N5oCbACVhAPvaRb?=
 =?us-ascii?Q?6uhxdCdHlAu1EhO/I0m5uWBoVHDBcVzpZwEJzvuWZFOsys4OTARhVZ0vCFzg?=
 =?us-ascii?Q?TuTxpiwEN/ZVGuwdAB2eED1jZBGPlarDBBECbyBdnC8dymqcRS4G+y2KcLeM?=
 =?us-ascii?Q?JlC3spjFfkXFBGm4iU9URR54qvdqRxlu4b5xLbsl9unBNZR0laV0kzjfq5iC?=
 =?us-ascii?Q?HuCs6fYMIO+3/5D6quCrNiwbkJJlFT/nGG/znVtR6EacPKNHfM6yHfptGz5k?=
 =?us-ascii?Q?fUEnbQIHZV15QC/aYHg/0nU2NSjJStjqeomhQzqGRKPOLbgT6IjXTVtTw71S?=
 =?us-ascii?Q?D+Fa0JQLBLMs7cTLReeXkAsCs9WUWVsqSurwuzlm2oTiT6vstrfWwMoLql8h?=
 =?us-ascii?Q?4/xsAiZ1Ji8LEh9BXxSKFdFktDIdUzrRzqxKhvQjwn3AVQb4O/rI7iMyS+6d?=
 =?us-ascii?Q?H6QZACU9Xk8SFFil3+dGyvx8r+HnP91uoNDVe1DRmNI3qOBZqSQTwn7r6C7E?=
 =?us-ascii?Q?uPo6rLKiPBq6fmnj4RWUWBtqwYUgMV1nyYRuvmeYEs8BeYuMUTpnqwG/lzXY?=
 =?us-ascii?Q?OwruE6wlw5goSvmlLdCBtY3S+nffCEYFjdMg9lzNpvfRu82PpgGf3WGwWX89?=
 =?us-ascii?Q?cPEGF08cwz1uY1CbnlDcffaWu9peUxPtZ19tyU1+no/YZZK3/QOONyvQbOhS?=
 =?us-ascii?Q?cmNdBUd/jhmoy7UyNF6D2kluOKxN6UT/MwzEDDVhUxIbBe5EIrfqQJHpGkA5?=
 =?us-ascii?Q?68LXdYHPrmuYVXvT8oTUxeFGXxRoutAVd8aRloelLbHFt2bpNpdyaB1mctaH?=
 =?us-ascii?Q?qoMFti6bu8Nm2x/SOer+18R54FPyN+xe7s/BXf6pXYdvmwjhA6Gfsuhjprl7?=
 =?us-ascii?Q?vQLyrdKszUZQ+6kUIQ4WjS3yELnvgfDz17jDmPzKx4tG3TqmW7ICaNdwtTKY?=
 =?us-ascii?Q?yH5Y2YWEsTZeqyrbcfUzzSgm7mQJA5YhzxLF4mwsxon/a49PhK4WE/g/nLPk?=
 =?us-ascii?Q?itjWZ3hVgIt/Xgd855Y0jtwoPyJW+bmAQb1vbZK6L8iJ7X89nj/EUFLIuRJk?=
 =?us-ascii?Q?BdTdO9LZ0DRzZjr28X/O6KS2lSdPma3FrySprXKVy5WUQyuLV5SAkz9tpAqQ?=
 =?us-ascii?Q?c+EtBCckEBDXkeR9PMB75uYZrYP1JJA+GwzzqePEtMO0NCRRll/IQIA3pOpH?=
 =?us-ascii?Q?/u7PXvCZiw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b19dc6c9-b753-4623-ffd4-08dedd976149
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 08:52:17.6320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gDNExeXvKJNmp+T9SO2MOm5YFzKmJSkf8rsa6dTwfYLUtTh3edy8iFtddVNapkMYVdazhngwRFD1P5ampNw+gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999283

Nova core will be used to export core functionality to other drivers
which will bind to it via auxiliary bus devices. Add a NovaCoreApi type
which drivers can use to call nova-core methods.

Auxiliary bus drivers can obtain a handle to call nova-core methods on
a particular GPU using NovaCoreApi::of(). This takes a reference to a
bound auxiliary bus device and returns a handle to NovaCoreApi.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes since v1:

 - Rework unsafe pin-init to make safety comments clearer, suggested
   by Danilo.
 - s/allow(dead_code)/expect(unused)/
---
 drivers/gpu/nova-core/api.rs       | 29 +++++++++++++++++++++
 drivers/gpu/nova-core/driver.rs    | 42 ++++++++++++++++++++++--------
 drivers/gpu/nova-core/gsp/hal.rs   |  2 +-
 drivers/gpu/nova-core/nova_core.rs |  1 +
 4 files changed, 62 insertions(+), 12 deletions(-)
 create mode 100644 drivers/gpu/nova-core/api.rs

diff --git a/drivers/gpu/nova-core/api.rs b/drivers/gpu/nova-core/api.rs
new file mode 100644
index 000000000000..610cfc01111e
--- /dev/null
+++ b/drivers/gpu/nova-core/api.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Nova-core auxbus data. Contains all the methods used by the auxbus drivers
+//! to interact with nova-core.
+
+use core::pin::Pin;
+
+use kernel::{
+    auxiliary,
+    device::Bound,
+    prelude::*,
+    types::CovariantForLt, //
+};
+
+use crate::gpu::Gpu;
+
+/// API handle for the auxiliary bus child drivers to interact with nova-core.
+pub struct NovaCoreApi<'bound> {
+    #[expect(unused)]
+    pub(crate) gpu: Pin<&'bound Gpu<'bound>>,
+}
+
+impl NovaCoreApi<'_> {
+    /// Obtain a [`NovaCoreApi`] handle from an auxiliary device registered
+    /// by nova-core.
+    pub fn of(adev: &auxiliary::Device<Bound>) -> Result<Pin<&NovaCoreApi<'_>>> {
+        adev.registration_data::<CovariantForLt!(NovaCoreApi<'_>)>()
+    }
+}
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 48380ac15f68..a5dabc84fbc6 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -18,6 +18,7 @@
     types::CovariantForLt,
 };
 
+use crate::api::NovaCoreApi;
 use crate::gpu::Gpu;
 
 /// Counter for generating unique auxiliary device IDs.
@@ -25,11 +26,14 @@
 
 #[pin_data]
 pub(crate) struct NovaCore<'bound> {
+    // Fields are dropped in declaration order: unregister the auxiliary
+    // device before dropping `gpu`, and drop `gpu` before `bar` because `Gpu`
+    // borrows `bar`.
+    #[allow(clippy::type_complexity)]
+    _reg: auxiliary::Registration<'bound, CovariantForLt!(NovaCoreApi<'_>)>,
     #[pin]
     pub(crate) gpu: Gpu<'bound>,
     bar: pci::Bar<'bound, BAR0_SIZE>,
-    #[allow(clippy::type_complexity)]
-    _reg: auxiliary::Registration<'bound, CovariantForLt!(())>,
 }
 
 pub(crate) struct NovaCoreDriver;
@@ -86,15 +90,31 @@ fn probe<'bound>(
                 // (`try_pin_init!()` initializes fields in declaration order), lives at a pinned
                 // stable address, and is dropped after `gpu` (struct field drop order).
                 gpu <- Gpu::new(pdev, unsafe { &*core::ptr::from_ref(bar) }),
-                _reg: auxiliary::Registration::new(
-                    pdev.as_ref(),
-                    c"nova-drm",
-                    // TODO[XARR]: Use XArray or perhaps IDA for proper ID allocation/recycling. For
-                    // now, use a simple atomic counter that never recycles IDs.
-                    AUXILIARY_ID_COUNTER.fetch_add(1, Relaxed),
-                    crate::MODULE_NAME,
-                    (),
-                )?,
+
+                _reg: {
+                    // SAFETY: `gpu` is initialized before this expression is evaluated
+                    // (`try_pin_init!()` initializes fields in declaration order), lives at
+                    // a pinned stable address, and is dropped after `_reg` (struct field
+                    // drop order).
+                    let gpu = unsafe {
+                        Pin::new_unchecked(&*core::ptr::from_ref(gpu.as_ref().get_ref()))
+                    };
+
+                    // SAFETY: `NovaCore` is dropped when the device is unbound;
+                    // i.e. `mem::forget()` is never called on it.
+                    unsafe {
+                        auxiliary::Registration::new_with_lt(
+                            pdev.as_ref(),
+                            c"nova-drm",
+                            // TODO[XARR]: Use XArray or perhaps IDA for proper ID
+                            // allocation/recycling. For now, use a simple atomic counter that
+                            // never recycles IDs.
+                            AUXILIARY_ID_COUNTER.fetch_add(1, Relaxed),
+                            crate::MODULE_NAME,
+                            NovaCoreApi { gpu },
+                        )?
+                    }
+                },
             }))
         })
     }
diff --git a/drivers/gpu/nova-core/gsp/hal.rs b/drivers/gpu/nova-core/gsp/hal.rs
index d3e47ef206de..06647b2b7894 100644
--- a/drivers/gpu/nova-core/gsp/hal.rs
+++ b/drivers/gpu/nova-core/gsp/hal.rs
@@ -36,7 +36,7 @@
 /// The GSP unload code might run in a situation where we cannot load firmware dynamically (e.g.
 /// because we are in shutdown and the file system is not accessible anymore). Thus, the firmware
 /// required for unloading is prepared at load time, and stored here until it needs to be run.
-pub(super) trait UnloadBundle: Send {
+pub(super) trait UnloadBundle: Send + Sync {
     /// Performs the steps required to properly reset the GSP after it has been stopped.
     fn run(
         &self,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 735b8e17c6b6..2d48d16a6ee8 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -13,6 +13,7 @@
 #[macro_use]
 mod bitfield;
 
+pub mod api;
 mod driver;
 mod falcon;
 mod fb;
-- 
2.54.0

