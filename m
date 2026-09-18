Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F02838B14B
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693741; cv=fail; b=KgBTsDlFm8XNBDKV3iucwB3EHCSs0qDHFGHR6voZCgwv+c/U47S6mqSQPvcfWvjustSFznK5A4Z36DgtIWx73ZMH3RtBgTHwBAIV5HVej6yISiWGJ705P11JD7IR9r+Fu70gEXQYnhfddIwEgqly7urUzT+c+SbG2bLPgMXG/Wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693741; c=relaxed/simple;
	bh=VeBVvYkfVRl+YxTL2J9ftxFKVFZ77Lfixc6D8gQJX8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HgAWNsExjt40G3/YhKJf4JKCM7+NQ6sFzsAVLOsV4jyqU17e0YDmIXhsVs/Sn/Y59no+KpmpJrajhMG3GbqpnrhxrLhKHwdp4Y7EV8rh4E503+uW63pGhD7f11NmQqXYtUMFhDeNn3/9n5aZ1Wr1xVqFErecbV+AHcNQv9BpB7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jP2h4M/o; arc=fail smtp.client-ip=52.101.46.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jP2h4M/o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOhturi5NdYWQo8oszCGj5uYG4wb8Uc32zG+wqZmqf1aRGvrRlOMfFtdJqH/ufdKolayBSAN9X0dhChEi053ARhM/s9FCHnhAwhJ0VS/rhHA4V3Z1/KBXB5vfIxMq9xv2R1t6iCDExmtMi+IL69NygASoipVLyN7UcDWjiww4p2hz7Qw+Xl/VkmyNrm0EogBWyitvoXLZa81PZ7S5cSZzsWcmGxlmk90ZnEFO3+qhcTuNIb0fETdFSYtTrlIx2beQN4lEqXNJ7Md0tUfBEJ2E/KkSa5QFSr1Mb7tXVzA/RvJe7PVfedQpU3ahQjOyxpnszs3Kxvg8q9RW87H3USeMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlD0GiyErf4pr/DZv7F4CjOnBBZ8nIJhH/IVoBgBUwY=;
 b=oPiWHdk5BV4l2J+mmm7/YOihRBud89ZDCh5ND0/lL7lDGjmAb55ehZ6NI3irwGBZ4WTR4xJMZWIr9nMkleSPKiqGqGaAHTULv21qD8q1SDtcgY/NGoWEnd0zM+PGnCrhsQPScXWmbLFZwQFtskZgX+r2R8dcES9dfQMqsykWMJmyX9xb0GpHx+DxASIDgOD7++ok8x5ZGhPBGc71dQ/qpwddhqbfp554ovVesX4nxXbSTFfZ7NoAi3P1PCqzSYvbiiNKYJSdSOt6UJ3vAFLaKtMZ8VM60KnplvXSHHVWpTNNFvc4FrCq5bMFfwfekFAjZD8nDkbsYCAXnpKxhDYqjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlD0GiyErf4pr/DZv7F4CjOnBBZ8nIJhH/IVoBgBUwY=;
 b=jP2h4M/o9mHHpkfXoOweTyLhJ2GKXJKYE5UfkELv0gHdq+iVYbJvmLc5Nq8K94ITA4yRnVI/euMeHFOMZ2j7ytNHYEQej5SiFz9GTBQAqGlyqiJ3g6Ko+Z0YhQQYamyZr92JM/61TJUo3YqwrBJ0q4jeGlmb0RjKJigKk/DrHN6ULdfW2XHFSGcmUEAwxFWqlj+mvTMKGQX9oGjHjIHgWTdUjCmAW82XQ3OrbHxCq5zW60kN8A2iI1B6a/I34cxT0TvTHago0FNms0Y4OH4SJ0b6R6jT4JyhCBRZn/rh7RjxDZpoCtSDpbfwSXOpI7dFdYnPpk7G04hGONNF1d1ZIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:08:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:08:20 +0000
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
Subject: [PATCH v3 26/33] gpu: nova-core: gsp: add the GSP_SUSPEND request
Date: Thu, 17 Sep 2026 18:07:12 -0700
Message-ID: <20260918010719.1176945-27-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0048.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf22037-42ae-48da-a806-08df15214658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|56012099006|3023799007|11063799006|5023799004|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	oThByu827eMu/oB7ymBoRlGjr5mpk+AFqudeidyJujjmCOKVCMKnZ9qjet27QhRh/vTDfr9mPB5Shc5bq7eGCLo7Q1aH9ugrtmYAvX4CGxUUeSrsEIReaih9c8VEH42na+kR6W5GzetxAA8i+f2z8B1gPBHttPTPJ1mvTpeHudwYxq2eySnYskh7PTmT9yImFXSoO4NhUjKArcx5n8vszGVx2tBwq7qdLA5bwrK0BXAWz/oXH9F4ynQDnOzzAfmjdLavrRCCGY/wCSKJClKJOk9ulP1nbkwzG4rpXFogHCROOEK8XsVhrYpApNTdD6O29h7sf5QhCwF1i84+YfBcS1ymYH318hRHbPdCbkxkbMsRuaQfcawwubSdrT0h7qyPwFkdb9qZNSw0POLNA/x/ZeklQkuisulUENyOBI0GlXCX7/E6wjf249laZ9kCHankXZz/t1jxAj/5yzlWX+d2U8edIOXDJkxO6WsyvSFXhM2KsI2uUwzusOmD9c7wlNL330CSjPdMAtAmnOz2wQRIzNjU4g0nvdqAPcjs9yHeyyN381UPMJ2o0JkjPZhJL51DSMHHKlcxxtqgXoKRs0lAoVtdcuzNM27rvgilU1YpJ2f7Cw4aGZmv+ijMPIy/kAoTGn6Yh2sOWhpJp1Xb00+AJb5xwq3zg/8BmXfu5jfJfpo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(5023799004)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JEp5JHVPjehUzHUktBOhAXAS3Rjc9ZsnM8DobAXyOXZnWj+Suyn51DWp98jt?=
 =?us-ascii?Q?5jl/h5E+4KNCSPagkNyRgpmLhCazlE6td2s1H3StZZ++ndt6RDwRdy6+CRFm?=
 =?us-ascii?Q?L62f10GnEMA7jmIZeguEgB0rf0+TUlqTxm6Bfz+ehGMf/M03dWwYoF0cus/8?=
 =?us-ascii?Q?Rn6hFyoaCGj61QVM8J3RXPyuL4lEEy1EzgRBKxbJoh+tKS3OilskdCFIZnTw?=
 =?us-ascii?Q?OfAZlLTf39rjM4aOwElHNoOqMEKjX9WxdyfqaL9S+4d+KueMBBWASAMbn9S3?=
 =?us-ascii?Q?s7uztuYxRHP56pEchY2hjDHQU6Y97dvLyTL5ieHw0u+sa3lZ0IXHeQxtJmYP?=
 =?us-ascii?Q?zJeaYmi6H99r77AvmX5S4bgXtoreMxpbuWlvSgEYAi+vg78Lz8CrV/EFy29I?=
 =?us-ascii?Q?ceIjsPQdUKXjlUsSU4PPiGfiLs5KZa3jQd+EpbUwje7BaaIk7Deb9WLSFAx2?=
 =?us-ascii?Q?LDedcPX8GFC/ZOLbwHoyatG+wmzGt2oQULY+wG/KTOusaSNpWch0Nq+VNewT?=
 =?us-ascii?Q?R57uav2XHIyvpDqKALVmcJyFGZOmNUR0IaN2piIC8lZKswpfFGAf22qeyGBK?=
 =?us-ascii?Q?hgChABiHLAIG0DJkrpzmmvv2TR0u24Jnwzgmc2sPeYs84DQZbqJcZqZqoepD?=
 =?us-ascii?Q?hwo6oBXLMI4NKhK27mckJCIzRV4lSJ5a8grwz3cu+qYpT8nmt3zbXBbin7dQ?=
 =?us-ascii?Q?lZ1WTWpoh0TuXgHlb7OJIkmjBjZ0i8u0wPd8XereeGzC3CA8iw8b2F440FcE?=
 =?us-ascii?Q?qyOxmUowd8x/BDMFZ+f3qdgvzOXGynXxOYRkCRS+0cmiX70FRlFzNVqCvvtM?=
 =?us-ascii?Q?neKImI9pvmP/cLTUD3YxxelAxblrctOVAHj0ft86jnzo+i6T56aBroLuJZl+?=
 =?us-ascii?Q?/HgLdnMHw+GyludhTb8kQaxuAOFzc9uik4+e7Ie9o882zibV4SNjNJMBFGwJ?=
 =?us-ascii?Q?vSVuhtmFaN3BxRilG8mwd1rjyYmJK/0ZJg1OqVuOrK8bHE3ad6OAk6O/Y0yJ?=
 =?us-ascii?Q?sRqZY3Xvvh1xp3bsWhYoZcPE4zJ8SqY2CXM2L27dE8uYXBuDvLf75C78HhmK?=
 =?us-ascii?Q?KvoBZ70J3Lf1QdK6c4u6cbByQ6bEWJpHR/wiKC49dKbwY312jmySfsJfrdgD?=
 =?us-ascii?Q?+Isn43GMUBy9kEQ/hrZsIokibvfY4mXaUq7YUsTpEMciN9wRuKpC542SwW1s?=
 =?us-ascii?Q?/bMphZhX0F9a/QM2k49lUep3lx7NH9Br7YYK6rHzGJbc0Iz9o1KFMcobS5AN?=
 =?us-ascii?Q?dDV+QhyIB7aosBHLZTcwSVHTLYMnK/QOWwgt2eA3UtsvGGiNnPJmSSFoOym1?=
 =?us-ascii?Q?jlfiP17WG95+a7Sag8UaXfhiaKYMlFfI5Ang9lCr6nFw/FzcTMrCjE3hWp+Z?=
 =?us-ascii?Q?0Amgwzur4+d3w7tFjbVmvX2TP7K4AbBr7rZrgEB5mdQ9NPbMMTP4XLBL7ph2?=
 =?us-ascii?Q?6A/NlrylgedwPl3efPySKGSBwRd3aM+V6ndOQZ+aveZey6dzq7dDAmZYL4Yt?=
 =?us-ascii?Q?xu5nT5zWarjY6hf9yr/MTn2sdDTM2B2hwKv402FlHq6v4X/7Yc732t90/I/F?=
 =?us-ascii?Q?2DpCpdvtHQMeoIVjPNJx2WbjGcgfBe1Qobl9JNtQ3XrmtwYCPi68UCoDLbkK?=
 =?us-ascii?Q?YnBKqJMQC+hHY6XjrhT5OFoGdRAb6Isjcd5oGAQPJtdvkR5dw3bjyidHZFvM?=
 =?us-ascii?Q?PBsr+98Voy/R2ysi1c6Vje8CG1ezA8l3EQ8jqP8SO/EeO3F5GdCi3pJfPGG0?=
 =?us-ascii?Q?uiEn8vabyQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf22037-42ae-48da-a806-08df15214658
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:56.9740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMh3DxTPvXLUU3ol8aci7qhWFYAHibX1G1frACrnwgcgDgl634TSRFaJsbTTsnR3mtCwrEzTHddFopslXnxKDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349

The r000 firmware suspends GSP-RM on a GSP_SUSPEND request, a GMC API
command whose payload is one word of flags. The one flag marks a
suspend that is a power management transition, S3 or hibernate, rather
than a full unload. GSP-RM sends no response on the message queue. It
reports the completed suspend in the GSP falcon's MAILBOX0 register
instead.

Add the request, and send it without waiting for a response. The
request has no caller until the following switch to r000 sends it in
place of the r570 unload RPC.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs    | 15 ++++++++++++-
 drivers/gpu/nova-core/gsp/fw.rs          |  4 ++++
 drivers/gpu/nova-core/gsp/fw/commands.rs | 27 ++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 74ae92428cad..00ff3271a46e 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -37,7 +37,8 @@
             },
             GspGmcMsgElement,
             MsgFunction,
-            GMCAPI_CMD_GSP_INIT, //
+            GMCAPI_CMD_GSP_INIT,
+            GMCAPI_CMD_GSP_SUSPEND, //
         },
         nvkv::{
             Decoder,
@@ -382,6 +383,18 @@ fn decode_gsp_init_reply(payload_0: &[u8], payload_1: &[u8]) -> Result<GspStatic
 
 pub(crate) use fw::commands::PowerStateLevel;
 
+/// Sends `GSP_SUSPEND`, which GSP-RM does not answer (see [`GMCAPI_CMD_GSP_SUSPEND`]).
+///
+/// # Errors
+///
+/// Errors from [`Cmdq::send_gmc_no_wait`] are propagated as-is.
+#[expect(dead_code)]
+pub(crate) fn gsp_suspend(cmdq: &Cmdq<'_>, level: PowerStateLevel) -> Result {
+    let params = fw::commands::GspSuspend::new(level);
+
+    cmdq.send_gmc_no_wait(GMCAPI_CMD_GSP_SUSPEND, AsBytes::as_bytes(&params), 0)
+}
+
 /// The `UnloadingGuestDriver` command, used to shut down the GSP.
 ///
 /// Only used within the `gsp` module.
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index cc0bc8f8ae87..ee582cbde5f6 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1069,6 +1069,10 @@ pub(crate) struct GmcApiHeader {
 pub(crate) const GMCAPI_CMD_EXEC_HS_BINARY: u32 =
     r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_HS_BINARY;
 
+/// GMC request for GSP-RM to suspend. GSP-RM sends no response, and reports the completed
+/// suspend in the GSP falcon's `MAILBOX0` instead.
+pub(crate) const GMCAPI_CMD_GSP_SUSPEND: u32 = r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_SUSPEND;
+
 static_assert!(size_of::<GmcApiHeader>() == size_of::<r000_00::GMCAPI_HEADER>());
 static_assert!(
     core::mem::offset_of!(GmcApiHeader, command)
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 748639942fe1..4e6c712637b0 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -225,6 +225,33 @@ pub(crate) fn is_power_transition(self) -> bool {
     }
 }
 
+/// Set in [`GspSuspend::flags`] when the suspend is a power management transition (S3 or
+/// hibernate) rather than a full unload.
+const GMCAPI_GSP_SUSPEND_FLAGS_PM_TRANSITION: u64 = 1 << 0;
+
+/// Payload of the `GSP_SUSPEND` GMC command.
+#[repr(C)]
+#[derive(Clone, Copy, Debug, Zeroable)]
+pub(crate) struct GspSuspend {
+    flags: u64,
+}
+
+impl GspSuspend {
+    /// Creates a `GSP_SUSPEND` payload for the given [`PowerStateLevel`].
+    pub(crate) fn new(level: PowerStateLevel) -> Self {
+        Self {
+            flags: if level.is_power_transition() {
+                GMCAPI_GSP_SUSPEND_FLAGS_PM_TRANSITION
+            } else {
+                0
+            },
+        }
+    }
+}
+
+// SAFETY: The single field is an integer type, and the struct has no padding.
+unsafe impl AsBytes for GspSuspend {}
+
 /// Payload of the `UnloadingGuestDriver` command and message.
 #[repr(transparent)]
 #[derive(Clone, Copy, Debug, Zeroable)]
-- 
2.55.0

