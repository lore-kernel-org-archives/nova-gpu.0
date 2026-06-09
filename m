Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012008.outbound.protection.outlook.com [40.107.200.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB363E63B8
	for <nova-gpu@lists.linux.dev>; Tue,  9 Jun 2026 08:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992261; cv=fail; b=C5HA5fns+e3fCZYoxVmhvOghvu0vamOmuBWnFGUX+pHn++9Td2oUwxCVcCpb2dKTXCBJWF+9Ptd0GFYkj3QmfWnSQ4gCLraa+c64mH2Ff+rGkT1uahM9Vw4svlbwmoPy7XhUSMILGhbvWwzF7UcqcRYgWmbhKKX7XV8v7iBoA7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992261; c=relaxed/simple;
	bh=qr2p209UPg7VstbCkvNfrvKO0/WPbTetiAC2Qt0Fy4c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bSXiOnQYD/rBGEaXD8jx5nOVXR6nKW6tk4Alg5JB6QOVRVh49Uk0ET9n8g+/A1HVJTgoJrXRLIQLXH3L0jn7GLi3SpyPn5NKsaSTxtFm+pJXv4V7vGch7FGD8trOS3QZYWLwFNrJHk5mZw7KYtMlY5vl+K2kLr8QNOUJIKXDyCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GWdkm9wA; arc=fail smtp.client-ip=40.107.200.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GWdkm9wA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywn5jAAgzWJGQ1e4v1TGMFA0ksjxINP107SMbbQ9L2iJWPiL4O9DKjZWCUQpDvEWAk7ilzRCccTS5iy5O0KWshkWhzuoxEBDqclBv+oIesCBfZzGMlXmr89LUrT+W4muXUrhLnjXm+m8SrXfXNvc5yqZlEuWXLcAKrYctZSplYNK6EMpZ2p7KOtyYBsn2t5u9d8hqWnglk9/T26EOcZqQS/v/6CgXzI56+5/ztln6m48hRyQWycWxdYpGqm+kKMJgUI50mQe+Z9bLOwmQb/BnBeePKK8kxYKSkka5wvmrrAkHZMuqiw4/rax/F/41i72AsEFwWJkTAaUltendT5zFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blm5ADJ0gII4a297N8zhaCpnQVxR5pYLJxR/UHi+++I=;
 b=sG/ntyZuof+dP+QWpvnkatJ16JBdPYRFxd6OiH/k3Ug9Bkvo6BC/2DAn5oyI0El9ZycAACJ/Q1ErDMCltmygxfouIvz3xujdw2UzHHVxGBpd76lbo2sKvRGLhvZZPqAn0viTThnEW2faEfslSJQlkh5DFbCaxevb/BXM+JqsGU6ZGOqhngQRW3E9s7zrdKltqqFCrxPIXGaIyPBVW7JgTAB895gicL49HeHSengst3kLsDKXwPQiPclxdBXVKISpXCTB+RFK5s4IB1uZCu3+9eBcA0BHareJC50bsKgX2J/BkTL55clYBERM42BYpWIuuluLPNiHiSVWKuyVbWGijw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blm5ADJ0gII4a297N8zhaCpnQVxR5pYLJxR/UHi+++I=;
 b=GWdkm9wAHrbANXb0c65zcQL3lEXGi9EErR2Gasb2nbGty3IU7ZES0agGuFl67A4JxJgp38OZZrh47kQXns/beOPmwfVmWlmC9QpCICtBZLnvc2YBGAcYJUb/cKT6EXRFAUUh2tA/hvSaZj5GrTVJNq797HSjY0JMdFQf9iev/Ye2WHg8XEinf84QUldb6t+/TGkuco0drUpH3eIN9b7vhLXpXG0UGjOkAaX1ug27UnhWBxro1d5cUlJrs9p1WD6yAeHVYZnpjkAfDBsOddwYiZp2s5eEOk5WjdEA6Tnxaevuyl+xSeqAJZ1IOvvN/ZSZo5f5gYasQf8l0vWS2wQ6BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB5616.namprd12.prod.outlook.com (2603:10b6:806:22a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 08:04:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 08:04:13 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 09 Jun 2026 17:04:00 +0900
Subject: [PATCH 2/4] gpu: nova-core: move GPU static information
 acquisition to a GSP method
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-boot-vram-v1-2-d9382610507a@nvidia.com>
References: <20260609-boot-vram-v1-0-d9382610507a@nvidia.com>
In-Reply-To: <20260609-boot-vram-v1-0-d9382610507a@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P286CA0044.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: 20da5faf-b74a-4965-5f69-08dec5fdb1ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|22082099003|18002099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	+fA5EPGj6Tr7PuAbx2jHixY+sZhNgGEBBq7ZWZL07S4lVHaHRewJgVNnU14P8SbvvEa39/BWtH5Kb0I3UVPglKcMOxqr2E3ca0czKA72MdmHboZjgSuwftPDIAsC/885vYlD58kh9xzuDU66BRKz9kiSQAEX1kumhhns1kEz6kGC2dhQEKXe+9ayibpkcYkDs54VTF056MjSywLWFUr5jdHkOVtRevGJ1RpHC/RM+Ffj/W5zhhslxkmUvOBm4JF1CLORdkiTPj0i01fGqjLTS4RtrIdfSPspBFR738fkEdgWc17dPsDAkkrSmlJf7ChTCRp23ixBGnZC6F+cR21MHKgItPTsGpF39T5Kq+6JLGNKF3XIt1lwYsnsmeYzeKn7e0OmhE8caXRJoK9G4Azr8FXMiWkGEc/Jate5zROKg/1lv6m63m//dmdBYe5GWQCJWv8JZ9EyECTDXlvgEIh08NiQPHcnAvelpf/3aodgzmaVhEoFDxAS59AQnGOte0CxavqPm1R2im2yruJIFkxb2ocqBO4q5KhOqZ05IwSOfwA8GiPWRVMNemzoDOWxDXdx5aN6j6fEFhjoBo/pux2uXSTWHAaUWgAt0s3JP0fD53rFtX6WWfq9fIKwgXfSEyhH/bnNHuUGAFMHbPSlL+6qkgefZmZsVOqKApIRdopcyGO015TsEADUlc8641ZRM/WB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aldBYkIrcUhLZS90TDBreE9nTnZraEF1bHJ6cW9RcEdFQTZlVGgvTHFGUXUx?=
 =?utf-8?B?aE1vcElBUC9nQXV3Wi9xVHZkR0NMRndrTDZuSXg2akwzclI2b1FrVG9KR3dl?=
 =?utf-8?B?Nno3OW5QMlgyaE5KT2J6U3d3Wkc0cUtvVHF0NTk0ZVJvZHdTb2syb01vRWtU?=
 =?utf-8?B?UzJqaWJOMnNkU1JnK2tQUWYyKytNVUQyajFRUHZTazNESzRESk9VQ0xtSTIv?=
 =?utf-8?B?SWtTVDdJcmtuNTFGSHVlN2NicldKWGM0NDkzK214TWpaVVlLNWRLSEtNYnU0?=
 =?utf-8?B?RWg5am9ST2hQR0Jjd2tjVW9aOWtDY3NZVVdiK1hvZ2lpajhtcmhLb2phc3lO?=
 =?utf-8?B?cEs1dE03UU9TWE1RZkJtYS9PdlgzVGZkeVdkZThpUWRSd0EzZUIwL0laZlJN?=
 =?utf-8?B?ZHZmNFVOR2FCSFVZMDd5UElkMW8wZERpcDF1RG1sbWY1VnVRdDExaEQ3TVRl?=
 =?utf-8?B?eUt2ZTNlejZIZFIrSnIwdzZ1aHRVS2N6d09MS0lwTGpaaFVBUmVPUUlOZDc1?=
 =?utf-8?B?aG80NUlpZDdvNlpLaEYveGF5emVlQmZRRVBrc09pSUN6cElScEhUSWtQWjVi?=
 =?utf-8?B?MGpRQklLb2NZdFg3dDF6NGkrSm40eEJpOFpkbHF2RTRiaWNRbTd3SEh2TXBT?=
 =?utf-8?B?MElPejMzOTNCUEt2Qy95Nnl6aDlBUmFSa21PWEVReXYvVUdENDFhQVUyWE00?=
 =?utf-8?B?c2N3alZOa01nNUd3N0JqeVFUWkhmRlVzSXhsZlJmejREdEpLYXNIZHc3aUlF?=
 =?utf-8?B?K3JSNTlpcXF2eTJMekRwOTlCQldsK0tOMTJYQmRNbEVZR3VrTkdieE9HM1ZI?=
 =?utf-8?B?UWs4K1N5eHZhMlJBWHpDUWxjdngybXVSMythaHkybUo5aEhrZDA2RWducjA0?=
 =?utf-8?B?aTZHSTd6Q3ZpdzA3YUU0ZTk2RjFweDBZMUFNWFlQeUY5MVJaTHY5bUN4V3d5?=
 =?utf-8?B?MElnLy8rVEhUQ1orckNpLzZ2R1BGUVNBUFBLb01jdVFOaHNhalQ2Y2dVRmJL?=
 =?utf-8?B?MHZKTnhRR2pwWkluZ1pnWlN4RTAxeUFCckI1b0IvRElEVktDa1d0eUFMaUMy?=
 =?utf-8?B?TzE4RkZJUEF4MCtvcnRSMFl3aVQ2Q09xWERObVhFZDRGZk5Nd0Zad2R5SzdW?=
 =?utf-8?B?Sm9vbVBBKzFvVlFLVHBhdEFwb3hNWUtmclVDTmhLSHAxVTJKNUF3UEpOVTRF?=
 =?utf-8?B?S1BtVlFLMVRnMlBBSFdNMWlzNnNackJLenltbjBHTmNSemtERmorc0szQmZs?=
 =?utf-8?B?cUV0VkhzZkpwU3BIRkZBaU0wTkdMaXUxdm9PUGEyYVRYMzhnZFh6TUJ5NHA4?=
 =?utf-8?B?NG56QmN3OEpCR2RyNWpEY2I3dUhDa2ZsaUVRUEYxNzRhSnp3WW5xcHlaMkY1?=
 =?utf-8?B?YXFJTnkvbGVaYkFpeGJsTHRXbGc0YTNQL1o4TkZCdGlUa3h5L0tacllGZ2ZI?=
 =?utf-8?B?azVpV2RkOEFCNHVQMWFkZ1dFZHVrd0FqYy81OGhvTWZva3dsWFArUUNUQTl6?=
 =?utf-8?B?VzNyUnZtRHNLQUlzUmExQmQyaUFMUU4yUW1yUno4dXFqOXV4bUxuejN1ZHc3?=
 =?utf-8?B?bGtESnNEU0YveHlVaVIzdnViektJaVh3c3dpM2lHR0J2aXRtc3NjTkdPalNt?=
 =?utf-8?B?Nm5TWnZLRjZyWElHN2lManljKzJTVmJzSnJRV1JLL3FuSGIzRElDcjRGbk82?=
 =?utf-8?B?RzFQUC8wRmczbHFUL09zNTdQaUtEYXNORG5RSEJWNjBJN1pUaGdIcUY4Y040?=
 =?utf-8?B?QXNzV1FYd05FTVg0WVc0ZW9Od2xCMFhoQnJ6WjNoWHlQUHRkNCtYOWZnRDh0?=
 =?utf-8?B?ZTlSeFhGWmswSGVrY0tneTFERmlVakt6WkRTYXFrRkxnSy9FWnJSOFhlbFg1?=
 =?utf-8?B?S3U3NDY3bHQ0MU9zbTZVbDNVYlNvVEJjYkxmbGEvcU1zTjlURXQzcVhDbW9S?=
 =?utf-8?B?eGhJclpjTUZHREhrZWdaMlJsQVhpZVZuRjJjRGR3QktLZXBPVXVoUlhYSml1?=
 =?utf-8?B?aW0zdFF5c2ZWYzhRMjF4UGEzdU00ZHRSTnc0UlBLN1k0OG5CNXhtMGVoU2JF?=
 =?utf-8?B?Y0syL0lwTTJTQVRVSTFZWmRBZ0ZyNVBLckFiT3hwQVh4TXpVRlNrbTNzcXE1?=
 =?utf-8?B?elBoNElEYjIrQVBnbHdNKytEeVZTbnNHY0lsZDYrNHE0TmlQdG9UOC9CN3RT?=
 =?utf-8?B?ak5xaDd3dSt1ZUpnY0xXWmluUlR2djlkMWxnZFNUNzBOZjRrTmF6SE80SHJj?=
 =?utf-8?B?U090RVEwUzdIZzBlTjdQM08wa0JFRFJRVnFwOExrYThJNm1Hdkh0d1kvQnpK?=
 =?utf-8?B?Y1Q5U0k3TVBUbDREazk2ZjVkemFaTjZwc2NJMUxZUitBNU5GQVV2TWdMaVJ0?=
 =?utf-8?Q?ZBs3gX4vUfWz+5R9wMPWClB8S4txFK8kMp7WpeTQF/B81?=
X-MS-Exchange-AntiSpam-MessageData-1: zVNck27uTfcJjA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20da5faf-b74a-4965-5f69-08dec5fdb1ad
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:04:13.3093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32x+hVbyrwV8l03RXDqGibKpcL2KLSTRYRBplbsngFSbOQnxjgiWXwFMPFUfmtbTYeal3DDNVmWtxJyW+3uR3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5616

The GSP static information is useful during regular driver runtime;
however it is currently obtained from `Gsp::boot`, with no elegant way
to pass it back to the caller.

Solve this by moving the code acquiring it to a dedicated method of
`Gsp` that can be called as soon as the `Gsp` is booted. This allows us
to obtain and display the static information from the `Gpu` constructor,
and to store the static information for later use.

Its location at the end of `Gsp::boot` was a bit out-of-place anyway:
technically, the GSP is considered booted after we have received the
`GspInitDone` message, so anything that happens afterwards is not part
of the boot sequence anymore.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs      | 16 ++++++++++++++++
 drivers/gpu/nova-core/gsp.rs      | 15 +++++++++++----
 drivers/gpu/nova-core/gsp/boot.rs |  7 -------
 3 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 6b3e02c71dee..a0cb36cdeeea 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -23,6 +23,7 @@
     fb::SysmemFlush,
     gsp::{
         self,
+        commands::GetGspStaticInfoReply,
         Gsp, //
     },
     regs,
@@ -290,6 +291,8 @@ pub(crate) struct Gpu<'gpu> {
     /// GSP and its resources.
     #[pin]
     gsp_resources: GspResources<'gpu>,
+    /// Static GPU information as provided by the GSP.
+    gsp_static_info: GetGspStaticInfoReply,
 }
 
 #[pinned_drop]
@@ -354,6 +357,19 @@ pub(crate) fn new(
                 // is properly run in case of failure.
                 unload_bundle: gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)?,
             }),
+
+            gsp_static_info: {
+                let gsp = &gsp_resources.as_ref().get_ref().gsp;
+
+                // Obtain and display basic GPU information.
+                let info = gsp.get_static_info(bar)?;
+                match info.gpu_name() {
+                    Ok(name) => dev_info!(pdev, "GPU name: {}\n", name),
+                    Err(e) => dev_warn!(pdev, "GPU name unavailable: {:?}\n", e),
+                }
+
+                info
+            }
         })
     }
 }
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 69175ca3315c..875bd0a22ac8 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -31,10 +31,13 @@
 };
 
 use crate::{
-    gsp::cmdq::Cmdq,
-    gsp::fw::{
-        GspArgumentsPadded,
-        LibosMemoryRegionInitArgument, //
+    driver::Bar0,
+    gsp::{
+        cmdq::Cmdq,
+        fw::{
+            GspArgumentsPadded,
+            LibosMemoryRegionInitArgument, //
+        },
     },
     num,
 };
@@ -185,6 +188,10 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
             }))
         })
     }
+
+    pub(crate) fn get_static_info(&self, bar: Bar0<'_>) -> Result<commands::GetGspStaticInfoReply> {
+        self.cmdq.send_command(bar, commands::GetGspStaticInfo)
+    }
 }
 
 /// Opaque bundle required to unload the GSP. Created by [`Gsp::boot`], consumed by [`Gsp::unload`].
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 8afb62d689cb..2eef4d1b058d 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -153,13 +153,6 @@ pub(crate) fn boot(
         // Wait until GSP is fully initialized.
         commands::wait_gsp_init_done(&self.cmdq)?;
 
-        // Obtain and display basic GPU information.
-        let info = self.cmdq.send_command(bar, commands::GetGspStaticInfo)?;
-        match info.gpu_name() {
-            Ok(name) => dev_info!(pdev, "GPU name: {}\n", name),
-            Err(e) => dev_warn!(pdev, "GPU name unavailable: {:?}\n", e),
-        }
-
         Ok(unload_guard.dismiss())
     }
 

-- 
2.54.0

