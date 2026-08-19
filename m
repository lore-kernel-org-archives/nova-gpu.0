Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010030.outbound.protection.outlook.com [52.101.193.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291263C1F45
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111588; cv=fail; b=VSJVcX9CgSyJi/ZUpybL3PmEKqxDoMDCqrtmS68gcOfsMIFv0ALJaC+3z7QEoXmIxGwl/+ZyJ01mO9/77vPfAA+wJOFLeXWubnbNbOzxv2/mN2V3SjRQEfSbZDKcDq5RVvkzuCE7Du4DsBmZdhnUUNndswmEle/j0JTs+TkcHgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111588; c=relaxed/simple;
	bh=mkKt12sQX669dbg+i9lk6Ubs10aP5dzDzstDN0kwYEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FWICdA55Qvwfm3B59fGSZ0TSB3f+cAs6d4uJlY5BtwudsFzQHY2XlN/q/sr5WzC8bkY2K7F6Oj5POtmM+FeJdctBSOfCs1oGAve6W+6Rxkl3LyyXPJohyG/d12lbTmJWIvcUscteEbrgxVIlvLgQOaM6Xd6t3EidKq/I/vEFOb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OoAlrt7a; arc=fail smtp.client-ip=52.101.193.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OoAlrt7a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsL43w/9aArtRHzoqVPMPvKYkP9PsyDH3ae7RveGtZg3KGvUdWrY3mxdE4sCPm8zhYf22PnNj2brkeKE0x9wtj6S+iGVytPPiM4pxr6EiyQQPN4gHCHu9OZkTTQYlokmy895V0NNaHZEjVZbop27CsUuxQrTfWRo6sQytX1iXoKHTkccbCCIHhsTq+JwC1NFhs1nJtrd6wV4T5vdfI0WtfSSs8w9aBFPk6tfmvYg+T/lSqrDdkAr6Zu4r8AGvIqBzoG4d/RWwqaVbkwIWweIkvzbKO9NUYW88OoEcA/ue9nId7oJJuA7czY8bgv+D85lvGM6A/LNRC4miChLRWxzyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9nMU2PRY4KZoAlVHlWh9I+WBcyiQmPftMOxPxmc5WI=;
 b=Yir6nrw7jE+VogXWQrI98TPwd/zDoZAaTW+D2/udT1oPuIYVlEzD/piQO7DIUXDhv5On6RB8eU0ZaWLFXC8u3CH4/b5PCVnFxcE9ffXze0UNMLoKT6m/+zDQvsD21104pnnPhvF3kOZwAsSRDbZzBq/gzG/Mpj7J6IQKnRJTIhSdq1/ebDQFbMEFE8Mfak62SFUVpiZ94jmUktuO3JJ5jm9h/FWwtV4fxwXPK5wfJ60S7k/yZHXuyI5kTpGOh5iVLbLQLyWTLAt3gxKjLYe0yBCtvLwx5p25MU7U6TNQZfzBo9H8lo5jclW26LyVELNyn+lIaJU87tyEzTbO2soyAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9nMU2PRY4KZoAlVHlWh9I+WBcyiQmPftMOxPxmc5WI=;
 b=OoAlrt7aXmT6bmNrm+VWlH/UneFoPS8LRw0p6PPFTh4xcF/I+QUSvMGWDdHM2xyM6ImLhiPvsnrr4hwDu7Yg74mzbM59xJnHsbWLPy73855wJfIHGb7NI+rObioxOJaXCGhc8QTzyXepnVbIT8itBo4ioP0KtygyLnqCiz4Lz6yeq3/AgKhKn5HWHzIVOIUa8ZB8j6L4wm14UwHf5cv/IkJC4lkblPCY9kwI1qRvnHMiOnikp2GMSqE+SQQK3EKgBp+HtcLUZHzIkJ80cLd/qGDJ7A81fTKH9q+HVl00ZQgM2odFBBrurU8Ztd2oCdmGjr/lQd/Z9KJ+olo3WW7f9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Wed, 19 Aug
 2026 03:52:47 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:47 +0000
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
Subject: [PATCH 21/27] gpu: nova-core: gsp: add the GMC boot event dispatcher
Date: Tue, 18 Aug 2026 20:52:14 -0700
Message-ID: <20260819035221.336390-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0012.namprd21.prod.outlook.com
 (2603:10b6:a03:114::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 165c9e15-8fe5-43ad-ae3d-08defda5553e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|3023799007|18002099003|22082099003|11063799006|56012099006|5023799004|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	mtWacy1AZjn1DcB8XBEX9QQGuddunWzcu3T1VtHp82xLVJMZQYeOPyq1N/19nXDCowpT+lkGvaneKRz7aQ05K5TN8hCO38OdBLFSCnHi5O7bTsKdjNtu8Pzlz091oug2SN3Gs6rdArg6e8M+UhY+rGSDH++588TrQfQsKP0+ve4R2qko5FM9WcjWYZ5kk9nBzemuraVuyMYQs94EAwvlJBnwOINWkJjHiAowIgtshiHSACBn7cVwb7iTP7GjTmjTYYXOWbN2B3jrEOrtqQMvdUh9pjoGL4Xip4y7o6y9U/vh+uXf7xn9fB2L/ku69BBZ3+MKahKmSzj+rFrGV0CHs8TZXVddL/CErhlmj3Z8zzIqNGbRV4uWtvJ7CmB5mI3awK4W7dci4y636T5T6GNSBs2rvjs2ajf8HBE0VpIp7rbmzLrX7qS2zooXav1XJ92yQ9fxBFewwj4P1Re1qqIOFnQ2NihRgTHrW+FcusmSwfA1OrVbzAVVy+jYPlHmkvHsldo9Kd8u6c5h/HF++rzwvOov950SEmyhC5o7TFTG+yUgSmptXSRv5mGT1k8SGgflgJ40x20Kuvhpz4xYyoQgTnd0xxAj8WXmdCcUF7VACX6KDewYPbfNhdLBsK97sZ8kP5MZRzs6HBSr5dXWl/OjJkG3a16+Q6+G1Bhkg5SFleg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006)(5023799004)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?is3x1qm48FYh7GUoIABCkkhpTdquZ4hUM3kmSQ8OTJ1m7q0GHapVxtcS4//W?=
 =?us-ascii?Q?2lYibpapi/ZNKYxxqWc4COoRw1G+nhjVam8TOhEk3HqKO5l5jbyTEQXtSmVn?=
 =?us-ascii?Q?O5rU6yLgi79bTDl7445jcIcqMKb4mYrl53kCMUMtjNo44+iI72GE1BIc/hbN?=
 =?us-ascii?Q?g+tIf5Pu+M2D249b4W2gEc+0imOMeuj0ZEwHKFuw0tLqGnKKAs2vHoMGNrLa?=
 =?us-ascii?Q?ZwQ1vB2Dntyj9D9A2PnJh7m3J49YH5eHCBx/v/fNg77lHdQuzaeyIbzhmmxy?=
 =?us-ascii?Q?bVOQwPrRDW04ZvS2tuWg7xIJt92vWGEXub6KBuTPtNu88KQFBnoZj/7Rrd+M?=
 =?us-ascii?Q?j8OcOivtM/2DAhgQkSleD5mXLRzdU9sRrdk4kw1oiPOCUtAB68IBke2Z7/tx?=
 =?us-ascii?Q?+LnPDv95HKs1UYLMJgIv+RSUclPUUwLboE331Kc3BY7MlVfkre7ZexX/Ui8S?=
 =?us-ascii?Q?fq2QUY5t7BINpT/1ZTzlJT1j5BRxKfl78MXLCRvAUpKdwTqFusWOuyaWuQ/K?=
 =?us-ascii?Q?p8AxVlUPQEcYT2jpNZW2cYWR/YaOroVHWilIrXF+KfhIfD1rhfn6upNmWJPm?=
 =?us-ascii?Q?E/jt1hHkXgeRZDz584DO0XeiLkTWwqzWik/YTobcyaI3GSLbgQgFks6IEWxB?=
 =?us-ascii?Q?yOeNUE7IKd0zbSW1SP1QnFtfzcMNsF/dNB84ViKhPo1M6wI8TF2sH0q55kio?=
 =?us-ascii?Q?PnKhskUK/2N+KJnGCX2Vs6N1ltEpxyMLR2rE7PKEukIZFGJIbXO1JcVxFRN1?=
 =?us-ascii?Q?tOgcG4Ry91+BF6m0bV6ro19bu0ldB1ARdml5xmU/V5L5Gx3iiJTVCsLre3wl?=
 =?us-ascii?Q?aygCF51XJFgwenZlG2PvBOT3xbtGmFQCxdm6LtOahCbWTT6y+qwXYwTnNxSC?=
 =?us-ascii?Q?95ImGQyS3iKHWDPSNyBRhrzn8Fsz6hcMdsf6sKyNhnh1ECFAzj0ouN7jsnFe?=
 =?us-ascii?Q?8zm7rfBM3gpW4T5o0i144MX0wED21j2C1JTqMMVd6Mx9lhoESZwn/zyEQhGj?=
 =?us-ascii?Q?C4sR3edEFpgI8NcfRIlDJYcTWbVCHfaG1BzqlmDp/TObJrJn+oycPJ47ovoi?=
 =?us-ascii?Q?GHQEQ/Mhw/Hdq3ZrxG1gC0O/egvwplYYBJolWgyFSam10N9FrS8Hz0lbqAaS?=
 =?us-ascii?Q?77a+c8LXZ75PM65kTCdGqsPZJ225e0/Mrq2Awn807xD4BZpyzChrZanVz8/Q?=
 =?us-ascii?Q?CfBAe7BF7E1OZ3XLBcWPES/9ylcqDNnckKEXg+z5QOuPUhMmp0IfbRmmwlaK?=
 =?us-ascii?Q?800RBW1hPcf0Q5boWX/mUrCXdOrlttGcHfiWaE1D0nqxwxANfzwjWFL+G10x?=
 =?us-ascii?Q?KF7l3nTCJ/6Na+5nzgUyhQuLHx5dLoFv+wSQhwF09+sf2WN5TyesGS6MRGF5?=
 =?us-ascii?Q?dhX/W++IDir5GwTltH1JVNgvzEhCXqNA71t0G8KnFKUdH4JdqdhJuwjZp5ZZ?=
 =?us-ascii?Q?oE7cxDITzr+5SwxF3zlW0Y38XPPYs6maSxDqoZchn0rxmQcy9s48AAU181wi?=
 =?us-ascii?Q?xaEH2GMK9d5hHMyyVHf6IT/O5fAUlDUoWG15Krj/ou+zsS1Zl9fL7H5dC29Q?=
 =?us-ascii?Q?2Ars6554Af7ZGKGJC6uf9rNhbBXIUtzGoDDb1Q6SSqwEai0LlL4xRcYSxQIB?=
 =?us-ascii?Q?gvGhOmCTgJLypqC2dQDnetJC+9L62/pFRxjGIVQV8aeJjpSxpV+3QRcodsXE?=
 =?us-ascii?Q?eMQohMS6P3yeM05sLMyZMj6n6ydXQvr/n39Oac+Ikw2NBn+Deu90wBHCpnlr?=
 =?us-ascii?Q?XhjrybcHnQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 165c9e15-8fe5-43ad-ae3d-08defda5553e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:47.6084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5VYGc+sOux/Jq8mVVo7Hmx4ARAjYBS9xl1Kp9bCkPxl74DxZtIhuxb1C6Iq+n9Eyf5n69ahdkNi5kWFkVgg3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5990

The r000 GSP boot protocol sends its two load-and-execute events as GMC
commands, each identified by a command id.

Nova-core has a handler for each of the two events, but nothing that
reads a command id and selects between them.

Add the dispatcher, keyed on the two command ids from the r000 bindings.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 62 +++++++++++++++++++++++++++++--
 drivers/gpu/nova-core/gsp/fw.rs   | 10 +++++
 2 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index d62a5c834ccf..15933ecc061b 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -36,7 +36,11 @@
     },
     gsp::{
         cmdq::Cmdq,
-        commands, //
+        commands,
+        fw::{
+            GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER,
+            GMCAPI_CMD_EXEC_HS_BINARY, //
+        }, //
     },
     regs, //
 };
@@ -162,6 +166,60 @@ fn core_resume(
         Ok(())
     }
 
+    /// Dispatch one GMC boot event to its load-and-execute handler.
+    ///
+    /// LIBOS2 chipsets send `GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER` and LIBOS3 chipsets send
+    /// `GMCAPI_CMD_EXEC_HS_BINARY`, so a given GPU only ever reaches one of the two handlers.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if `command_id` is not a load-and-execute command.
+    ///
+    /// Errors from the handlers are propagated as-is.
+    #[expect(dead_code)]
+    #[allow(clippy::too_many_arguments)]
+    fn dispatch_gmc_boot_event(
+        command_id: u32,
+        payload: &[u8],
+        bootloader: &GenericBootloader,
+        gsp_falcon: &Falcon<'_, Gsp>,
+        sec2_falcon: &Falcon<'_, Sec2>,
+        bar: Bar0<'_>,
+        dev: &device::Device,
+        bootloader_app_version: u32,
+        libos_dma_handle: u64,
+    ) -> Result {
+        match command_id {
+            GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER => Self::handle_load_exec_bootloader(
+                payload,
+                bootloader,
+                gsp_falcon,
+                sec2_falcon,
+                bar,
+                dev,
+                bootloader_app_version,
+                libos_dma_handle,
+            ),
+            GMCAPI_CMD_EXEC_HS_BINARY => Self::handle_load_exec_hs_binary(
+                payload,
+                gsp_falcon,
+                sec2_falcon,
+                bar,
+                dev,
+                bootloader_app_version,
+                libos_dma_handle,
+            ),
+            _ => {
+                dev_err!(
+                    dev,
+                    "Unexpected GMC boot event: command_id={:#010x}\n",
+                    command_id
+                );
+                Err(EINVAL)
+            }
+        }
+    }
+
     /// Handle a `GSP_LOAD_EXEC_GENERIC_BOOTLOADER` event.
     ///
     /// The driver does not copy the image the GSP asks for. It writes the descriptor the event
@@ -175,7 +233,6 @@ fn core_resume(
     ///   size this driver mirrors, or the event names a context DMA slot or an aperture that does
     ///   not exist.
     /// - `ETIMEDOUT` if the GSP does not suspend, or the image does not halt, in time.
-    #[expect(dead_code)]
     #[allow(clippy::too_many_arguments)]
     fn handle_load_exec_bootloader(
         payload: &[u8],
@@ -268,7 +325,6 @@ fn handle_load_exec_bootloader(
     /// - `EINVAL` if the payload is shorter than the parameter block, or the ucode id does not
     ///   fit the BROM register field.
     /// - `ETIMEDOUT` if the GSP does not suspend, or the binary does not halt, in time.
-    #[expect(dead_code)]
     #[allow(clippy::too_many_arguments)]
     fn handle_load_exec_hs_binary(
         payload: &[u8],
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 83f7d2042aa1..4772af362117 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -979,6 +979,16 @@ pub(crate) struct GmcApiHeader {
 /// `GMCAPI_HEADER_COMMAND_ID_MASK`. The remaining byte carries flags.
 const GMCAPI_COMMAND_ID_MASK: u32 = 0x00ff_ffff;
 
+/// GMC command asking the driver to run the generic falcon bootloader against a descriptor the
+/// GSP supplies.
+pub(crate) const GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER: u32 =
+    r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER;
+
+/// GMC command asking the driver to run a high-security binary the GSP has placed in the
+/// framebuffer.
+pub(crate) const GMCAPI_CMD_EXEC_HS_BINARY: u32 =
+    r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_HS_BINARY;
+
 static_assert!(size_of::<GmcApiHeader>() == 40);
 
 impl GmcApiHeader {
-- 
2.55.0

