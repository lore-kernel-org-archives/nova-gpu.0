Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A45399CED
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693702; cv=fail; b=Z14Neyyo174TkeeR4agaA+4zGp49iSaTENPyPbhS+ZeiIrE9pdTRmoYQ4HAz7mpeTEgb9C330vTnw/kluteRpH57F7hYxE90swABFol3iuOODxQ8U4RPXtwIz5lWbQYFGmw6IGlETlCvixSAN170n3PaWg4RelsFwb9Nk6jh7Qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693702; c=relaxed/simple;
	bh=juG36SX1oVyaUmrXZ+pdxRO21erSi4t5oVcnF3QHLmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HvxgWorvMeGOBO/NVqBtguYMlxvYSF7sW6eWNS4Mo/a6BQ0bFbC8tgJ/v0a0AAVe2M0QL1dYxQ7iGSvovBUCW/vT+hTZ1XPr9H6wbLDk9VxwGzPDIbRW4fXZ9fmpjBm1Mztujh8zNAorjmWALk6Cat8GwwB4qdI3D50jcOHBFHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c6VSqEi9; arc=fail smtp.client-ip=52.101.193.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c6VSqEi9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJRSqUqfdXTDo+dUlLcBusH755Y63y6NWaCRYuRmXlQSwHWYAVkU+iPDudaAXeUmUk9eV6dM6LNVo72QtBmLu58/QMhdUwp1ws7UhwixcI4gTVkYH5l9K/6HpNQITeXNkKWgka9E63EZ8mn/joh5XZR5+X3PFuVgMmksmzrP7DooYXaMjo7o/V2GiD4OMstH9qXaM/vAEwJEJt6ELaNM1/BRi8kAQBA0EWW1PZFNAPaYbrliWrhGz3a0GOh7U/yScz8rw6j3/mZLX6bcoTWOwsWfbEGXEV2Y9o9nrnEkyAEUq2ZM/Xt5sNkp9roJSfHuvddawRrZCgmPuRwGKMDmBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKLFXf62SRrX6gUDPnSbD5Tdw5ugaXPmB+49aDuKNXY=;
 b=Pd65x/x8YLgsJqeROPRE5LHGBcge+9vJp0jBg8L/mMSvt08XFqDBS3mdn9YLNhcPBPdaQ0WxsRxhQ4udREP8Y/t2MXQJh4oi0wI7wAfX+En8WmCD4dzD8RjnjBo9qLMuEKw+lcQx6Os7aBZBEE2u9FNe7VB7cczs+Q0Li9W7mpB1fsLIDhYEcBFGS6Jl2xF5qF2rm0yFKRZUZXsrpbUi8shp9KQUQXjxvQ+xZJG13qCxiUP2TWPgqqwAXYXUWQ9fokZgDBOiUwdKpVnfcJoZzRPXmr/dpGY0FHuESxFVWwKxY5/41ycTTmN5bWHAL+tVivqzG/P9fv/kBf/N7V2ExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKLFXf62SRrX6gUDPnSbD5Tdw5ugaXPmB+49aDuKNXY=;
 b=c6VSqEi9iFkWozFCSV13I0Jz8h9BM3Y1yJVtJwPPzC7r8nXbn1e/6C+Ip2WWurb+ILdh5ejTrSlwtjn9K+Bq1WUwOhu5oe9mc0ySBHdmQTDafe/W+FoRyT7I8tH03hUoj74RqhkwKVSOfqfDOcUOf3lc/Sh3vtGA6IGLkSlgWQBJK6X2N3ZQnX8Jy3gqCLnsaikA4BCLVit/ay0NtUEQyLBAh9XUuvwRMtq48eYHvl6Hz4wcflz/pH5LKaNx+IeysAHhPi/1IRrdAFZK2wU2AxecFma0TzC5KH3C0ARX4zH15dOkZN4poMML/476Uy7rV8ZxxV0hYtU2Hrn+dNMWug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 01:07:47 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:47 +0000
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
Subject: [PATCH v3 18/33] gpu: nova-core: gsp: add the GMC boot event dispatcher
Date: Thu, 17 Sep 2026 18:07:04 -0700
Message-ID: <20260918010719.1176945-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 18cd9f79-12f9-4d4d-24d4-08df152140cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|3023799007|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5fp48oKNWmWg6mz/LFQkdp1oi81Zuq08Z/g4qkKFyWGnDHs014wOfb2mPRMa6dug/JRo5V8o4uJXb1CZ4hq4Ti+Fe8GVj87O9Q/6F610B81DN4ZG5h3Em91IvZEqm8xaoM5xLac4P4k0osi/qlNcggAcCAqHYQaJkh4L7WtN59NFNwBStu5csazSooZzzPTKVgARkk1R9tnvuQgI0O4Gjrj0HVF5P97W41XPy9uCKYE+Pdghwvk1WjdL62KTF5n8M9gxyT1oyktDAJgBYqqRd6de44HPkdEqe2agBV/EWZyMv/hoOCSY/H5mk+5YtzlC3Xxaaui8PtihYpCqmK6aVHHcpv0dLBkfm9OUznxpH3ph6eq4+NlLFBIMHAlxs7NqEcDmZm+LGuVUfnKgq4fQosokHs3KfgrkDoaKioIZfOjD63kD3SiPwbLnsCuWCRRE9neMqshzL0VRUv/ctZQRucpSBzlwvx+ETDsnql9p4eabK6FoYkdMfcuzSLGoj7OR1QCCYwW5TEQ/ekVLJb/eK7X2sTenY0WbCrhorvKCyyPS6fPC2ageZ9qvAWejiQZrpt+9GyZN9220igIqnGTvo4Eyv8NFi/onLugVJltcmfiDTA1SRix/ZyWDRw7QVSJv46C6EM323CtWaa+RWAjLLt4ZCfh4gzoOuIimshHkE8M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(3023799007)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2td4OeV7GRLsRDV8HQ58mmGCpcNOxqM3+/Yunprw7X1LyHZ5I31wp00i9/dW?=
 =?us-ascii?Q?DknN4joYRaPr4HRU8gJENKzos598m1yM5OMx0jG/Q0tPEHeXRThEyM543F6s?=
 =?us-ascii?Q?0fcKD/cUc6p6w7IXOsnrIZfCFMRfwCaoQTVD7MJcB+gmfb0zOnvXAZ3CZZgW?=
 =?us-ascii?Q?AMs51ijtKqTcf6wwyomTiRsTYnAh83bCjwDmSn36Z/MpZzgsWShtY63Cyp0g?=
 =?us-ascii?Q?6exZ/XofiEV2J/JsVTXsr93TbhHGYSK9fIukT2vbSdEUShjGYHimxJR2ow5v?=
 =?us-ascii?Q?ixfmvCziIhoeNpPpHZvZkB0HubrmBVmSy8MjBGkOoog8DHn9nY4LDLmPMRJ+?=
 =?us-ascii?Q?ACYWVKUaIX724WNvNCi8Y7TeYjNEmRhH4eR/+caWWV6O4/Xw/VgZfh7wb+I+?=
 =?us-ascii?Q?ahZZ0FK1j2UOra77OhLGDw62R0++olI3DQQKHgSMwxXMv1iKjrd9goOPZEdT?=
 =?us-ascii?Q?1kscwxL22C+MxklyZyZ3Ki5nYWfjPgdQ4lvVcEw4jJu56gI1uSQ0VjAGv3d9?=
 =?us-ascii?Q?o9ipsO5we7M25ytDu3qc08y7t/5m+qY+PpHFVQCN1kc7JRR8aYuRaGMWKrNg?=
 =?us-ascii?Q?hByoAgJjk/Y0vFvjhhQ/wlBotzzEQHXRCmjTv7WOxEAuwbVDS00BnZgTZ8In?=
 =?us-ascii?Q?1Cb1JiHGi+zhiUEZBZE/+rk4us8Ca+vW0lqOKihmvx3b0BHnEtgmbV4E4sbD?=
 =?us-ascii?Q?3YWMTmvwdwog6E1AJBAeOotAetVKutkfhRiaa6Pb4ci6U0y3hi6JzypflIbZ?=
 =?us-ascii?Q?2ZHCdQSKhQRffkQjgf70szsbI/s3OP4hyDaDAxkPGZypVBbFmyeEWc3kchE7?=
 =?us-ascii?Q?QGZFCam7g02MgMUWI5YOxzsLZ/TKtAt1pJoRG3xAOD7zs9MW78UL89SKlVPE?=
 =?us-ascii?Q?ulMgJIqj+kQOZtBLem443Mx3j2hDZXhGU9GNZ0R4iZpjk4TfC1doi6F+w77j?=
 =?us-ascii?Q?Vrpy8hG1APYZR0eiawnhVqOiHxlPArUSxgJ0WXISt7GTUKYEsOX+22MY/xbl?=
 =?us-ascii?Q?w4q33F3dv7AQBpFKJIjyfEAok6yGGaODEBjHgETfroGZ7rH1+rfY9yw/qZ6e?=
 =?us-ascii?Q?dmRICRfG4hf78rsPeRChAtQ8x85bFNnweZv6Tdz8iXWath7ODwObfEFlKSt3?=
 =?us-ascii?Q?mfT0beNPmcqFQ8pXxU9D+iFRuvv4OYS5eQUa86PgYQWZcy7XguvGCefMcTRT?=
 =?us-ascii?Q?T7yuk1ku/k/12FEGNqTb+7wSNETV+toJr9sf6T/BgenItbTIcndn43Ti6lO1?=
 =?us-ascii?Q?LVwv9A0fHG0FtBa24Q7dVhz48gMRLsG4I8TZ2bv7oXv25k2rbrGeLarSJx6S?=
 =?us-ascii?Q?c2/fbQfYd3vGyrOeD2h+dn5puiznu2vsHEfnc18XT9h6idzqAVrQj68T1CXh?=
 =?us-ascii?Q?ZJ54OOFjGPjpG4nyMMk1FzVLFAq+FPAqeVCV8p8zsAfNsKKB7KUwxsMfHh2a?=
 =?us-ascii?Q?uW2G1CKpTOdvRycm0jDkrNvuBg8NSzZJAvoFxpUDTOv/2RRkdbG8J+e4BnRt?=
 =?us-ascii?Q?BEhp0ElA/9+k5it4afyQnBZ8LgXXfGDyaE5hh6gBcx52gPyWvQS2HuJ0ahw7?=
 =?us-ascii?Q?mwmNLKNb7Sl7K0jZ5OQh41XmxMxBD6PgqJyz7yzU6gUdCItX0Dc3jGdUMrBk?=
 =?us-ascii?Q?udfvSmS366kLPaT74bmY+TIhqUVuSSkbAGxEU2rnAfEU94qz2fAILd2/qzoO?=
 =?us-ascii?Q?jTNMtl5mcw1hAQy51VCGjn2VkfKut/lqSMNz961tGwaq1jWtG3lssHnpD9/+?=
 =?us-ascii?Q?fRcaEIVzSQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cd9f79-12f9-4d4d-24d4-08df152140cf
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:47.6962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IvQrEq5u+kcxNm4yKE3erbK/UsE8OOa3h6GYu83ln6shxbcNNZFaPNI07BuvwIx5zc2mudZpyLTkDRy+Jeyk8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

The two load-and-execute events of the r000 boot protocol arrive as GMC
events, each named by a command id.

Nova-core had a handler for each event, but no dispatcher that read the
id and picked the handler, and each handler ended with its own copy of
the core resume.

Add the dispatcher, and move the core resume out of the two handlers
into it. Each handler now ends with the falcon halted, and the
dispatcher runs the core resume once after whichever handler ran. The
dispatcher has no caller yet.

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 69 +++++++++++++++++++++++--------
 drivers/gpu/nova-core/gsp/fw.rs   | 10 +++++
 2 files changed, 62 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index ee366d782218..c805b42dd7bc 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -39,7 +39,11 @@
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
     regs,
     sbuffer::SBufferIter, //
@@ -141,10 +145,51 @@ fn core_resume(&self) -> Result {
         Ok(())
     }
 
+    /// Runs the load-and-execute handler that `command_id` names on the event payload, which the
+    /// ring may have split in two, and then runs the core resume.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if `command_id` is not a load-and-execute command.
+    ///
+    /// Errors from the handlers and from [`Self::core_resume`] are propagated as-is.
+    #[expect(dead_code)]
+    fn dispatch_gmc_boot_event(
+        &self,
+        command_id: u32,
+        payload_0: &[u8],
+        payload_1: &[u8],
+    ) -> Result {
+        let handled = match command_id {
+            GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER => {
+                self.handle_load_exec_bootloader(payload_0, payload_1)
+            }
+            GMCAPI_CMD_EXEC_HS_BINARY => self.handle_load_exec_hs_binary(payload_0, payload_1),
+            _ => {
+                dev_err!(
+                    self.dev,
+                    "Unexpected GMC boot event: command_id={:#010x}\n",
+                    command_id
+                );
+                return Err(EINVAL);
+            }
+        };
+
+        handled.and_then(|()| self.core_resume()).inspect_err(|e| {
+            dev_err!(
+                self.dev,
+                "GMC boot event {:#010x} failed: {:?}\n",
+                command_id,
+                e
+            );
+        })
+    }
+
     /// Runs the generic bootloader on the GSP falcon, as a `GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER`
-    /// event requests, and then restarts GSP-RM.
+    /// event requests.
     ///
-    /// The descriptor that the event carries names the image that the bootloader loads.
+    /// The descriptor that the event carries names the image that the bootloader loads. The GSP
+    /// falcon is left halted.
     ///
     /// # Errors
     ///
@@ -153,9 +198,6 @@ fn core_resume(&self) -> Result {
     ///   it, or if the event names a context DMA slot or an aperture that does not exist.
     /// - `ETIMEDOUT` if the RISC-V core does not suspend within two seconds, or the GSP falcon does
     ///   not halt within two seconds of starting the image.
-    ///
-    /// Errors from [`Self::core_resume`] are propagated as-is.
-    #[expect(dead_code)]
     fn handle_load_exec_bootloader(&self, payload_0: &[u8], payload_1: &[u8]) -> Result {
         let Self {
             gsp_falcon, dev, ..
@@ -205,16 +247,14 @@ fn handle_load_exec_bootloader(&self, payload_0: &[u8], payload_1: &[u8]) -> Res
 
                 Ok(())
             },
-        )?;
-
-        self.core_resume()
+        )
     }
 
     /// Runs a Heavy-Secured (HS) binary on the GSP falcon, as a `GMCAPI_CMD_EXEC_HS_BINARY` event
-    /// requests, and then restarts GSP-RM.
+    /// requests.
     ///
     /// GSP-RM has placed the binary in the framebuffer, and the falcon's boot ROM (BROM) verifies
-    /// the binary's signature before the binary runs.
+    /// the binary's signature before the binary runs. The GSP falcon is left halted.
     ///
     /// # Errors
     ///
@@ -222,9 +262,6 @@ fn handle_load_exec_bootloader(&self, payload_0: &[u8], payload_1: &[u8]) -> Res
     ///   fit the BROM register field.
     /// - `ETIMEDOUT` if the RISC-V core does not suspend within two seconds, or the GSP falcon does
     ///   not halt within two seconds of starting the binary.
-    ///
-    /// Errors from [`Self::core_resume`] are propagated as-is.
-    #[expect(dead_code)]
     fn handle_load_exec_hs_binary(&self, payload_0: &[u8], payload_1: &[u8]) -> Result {
         let Self {
             gsp_falcon, dev, ..
@@ -297,9 +334,7 @@ fn handle_load_exec_hs_binary(&self, payload_0: &[u8], payload_1: &[u8]) -> Resu
 
                 Ok(())
             },
-        )?;
-
-        self.core_resume()
+        )
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index f23d071f0e16..e86283f67358 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1055,6 +1055,16 @@ pub(crate) struct GmcApiHeader {
 /// Bits of [`GmcApiHeader::command`] that hold the command id. The high byte holds flags.
 const GMCAPI_COMMAND_ID_MASK: u32 = 0x00ff_ffff;
 
+/// GMC event that requests the driver to run the generic falcon bootloader on the descriptor that
+/// the event carries.
+pub(crate) const GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER: u32 =
+    r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER;
+
+/// GMC event that requests the driver to run a Heavy-Secured (HS) binary that GSP-RM has placed in
+/// the framebuffer.
+pub(crate) const GMCAPI_CMD_EXEC_HS_BINARY: u32 =
+    r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_HS_BINARY;
+
 static_assert!(size_of::<GmcApiHeader>() == size_of::<r000_00::GMCAPI_HEADER>());
 static_assert!(
     core::mem::offset_of!(GmcApiHeader, command)
-- 
2.55.0

