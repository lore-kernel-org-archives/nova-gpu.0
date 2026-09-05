Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011029.outbound.protection.outlook.com [52.101.52.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C843CF95E
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 08:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788596033; cv=fail; b=V0K+hmdK4faagHIAR6INjnq4HQx46mK9F6PM0Otz9WhHWtwXC1MBJub+I/371/1wY6cxb7lsxRHOdQ2jM8DoVv6YMHBpA9pXZOay2B6ngAwdWJ3wMr958WF7ObwEwZILEpiL8c5kf+jls86/RCBcQuyAdajpAeSc1BA6CHrPiAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788596033; c=relaxed/simple;
	bh=8wQT7w2f7l/pYLkPTGf3v9/AtIgYGBOCKAPOnrf0hTk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GsBCAfSk1YBGSFKJ1e8ExyQ3bwFWX7w6FiHWUoDP5njNmF8CfkLjDda4JX3945FM2GNu7pBQqIy49pZc40QAWGCHbdYfVRAmKoN+HOtSV0mIAdhxF0lywrSjDXzlh5gYCfvxrtnqlINniEa3X9mB5cAb/GtUXIkbQ9kltJ9fxAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oqGp7taH; arc=fail smtp.client-ip=52.101.52.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oqGp7taH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4DsBsWuL1B/h59XeYNUFaQ/ykH2ZehufrSgVftiwjh278nZurIYeLhy1Evzp3+PCnWD+3MEs2nxQ+FcTkW6qvZXcWZ046MuIDCx7DI6HnhPlWY5CzWUm8lcFz6OxLTtkNpBeKiAIKZW62oYUfxlQfeMSdShLEiJ6aNbHI92dpQg69piek42Mf/TEQWqN4O1QsQyOnT/e+w/y9d/8OaGWDjftuhMEcYUAyJIIx3QhY6Bh3SYQgVIVnd24uQ1Z9zBc2nBgS3ou5E2IgK1fwp3JYfqAkZpUeuPdCQ0RbKb9OVw5CGA592/PYtl6Mujgt4HXtffqewdAplxCVhkuuHjAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLRIuTpUlfuNUQcS3zGgxB4KCl7DS1YmBFEeMTEHExA=;
 b=m6urmRK4+E+2Y2mRCVjDNvrLZ0+cf6DSy5MN5qwlLrwI9m1Xe+5lJbou2L5nJyC7742PiNEiUMDNzKys2GlJTzz3ncXu1p5eQNVJGPkitFjJbpret9PK2S7exf+o1RdaBafi9kaior5r/B+zgudSzR+r/m4evduj6xTGD9V8eVklsmvzdBY1I2Y0ahvdqMJXUfKVwp5jOeKLiE8sMC243qAqFzP3ODlPlie8vNukVU9QZp8YqbpuDeuevmeh/WffJ8pdp+QILPQ4a0mMbNXjITQgr/PxkTjBl/Ehjh1lNLT+PRVLm4M6yxhCCI64rFH5sKMdHUskIL0ADCLy82Z97Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLRIuTpUlfuNUQcS3zGgxB4KCl7DS1YmBFEeMTEHExA=;
 b=oqGp7taHVdepjd7TfmF7U69p/yvfZqZsQlhe1SlP7solbfEPQiuZ4mfr7OxsEao30F0rqJ39mIdOosizM2t/hEkXouyRVT043w9nd5tCzvdJT0gEjOPrAZsuL2NcUOj9SROPDSEiPEianY/2jcqDiFM0jOaOWDPpbArbfTiICo3KfC3qoWcnX9bNSqmgHuWS741SHKL0tpHKd9S0zypVdsj1boy8ipZXp+h4GujUazwmO9s4QS+5/WVkKubDe4a0OimVVhkN7OGn4Y9oiNBTovYq0kt7kaaR844zMGLdKdlqm0aFbiWN2pqHQBmrMEiBMuLUX16+xcjIHLUle3/QiQ==
Received: from BN0PR04CA0081.namprd04.prod.outlook.com (2603:10b6:408:ea::26)
 by MN0PR12MB5788.namprd12.prod.outlook.com (2603:10b6:208:377::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Sat, 5 Sep
 2026 08:13:37 +0000
Received: from BN6PEPF0000006F.namprd03.prod.outlook.com
 (2603:10b6:408:ea:cafe::92) by BN0PR04CA0081.outlook.office365.com
 (2603:10b6:408:ea::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Sat, 5
 Sep 2026 08:13:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN6PEPF0000006F.mail.protection.outlook.com (10.167.248.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sat, 5 Sep 2026 08:13:37 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:13:21 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 5 Sep
 2026 01:13:21 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Sat, 5 Sep
 2026 01:13:12 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <alex@shazbot.org>, <jgg@nvidia.com>, <yishaih@nvidia.com>,
	<skolothumtho@nvidia.com>, <kevin.tian@intel.com>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
	<boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
	<tmgross@umich.edu>, <jhubbard@nvidia.com>, <ecourtney@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH 13/13] gpu: nova-core: reserve the 48-VM WPR2 heap
Date: Sat, 5 Sep 2026 11:11:16 +0300
Message-ID: <20260905081116.106613-14-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260905081116.106613-1-zhiw@nvidia.com>
References: <20260905081116.106613-1-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF0000006F:EE_|MN0PR12MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b2916f5-aaac-44f6-3910-08df0b25966d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|23010399003|82310400026|3023799007|11063799006|56012099006|6133799003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	IDXWDVEjAgxqE/cD9yN6juCG4oljlQRaS5AcmF1Wkur5iYkowB13kkxqCs8uNxWBo1D11i5C+NauF8dPJmiQfgnuifC5qDQPPndD0KaEDLpnFNFAm+15xn2Ntbmqboxw4oH7fMwxGeCw3SSLO7wwe2p2XLhuYmD2rTTRoA5zax5FWl/FR5lLeF2D0N0Pn+y4hAdbHca7q2WCCy+wh1/3F9D0+cQ6Zit537rdaGYCTT3YtCiBZoZSyk+k8kCMQox6ARe3xJtMl3WS0Y6j53lIhsH3tKQqt1ZpVTomSX8L6Yb3MeyYJ1nJrMbXbj3rzakvz0tdi9qp8w2+0YkULZPwtfhEs55M/1kNEH8OMH61aX6YAANOBzhTjbfmmO6ytuHKv2hfd0bY7XhDhm0nnU1W7waJi5TNzS84InCn3kescFLdUo3C7y8INfk6GniWLi/MkBaEVeYZHkVzfdn0VEtqDaDknisV41tETQqW4MnxHOrQThp8Xtp3Ns8eEiDq4wmDTne3/cjB3G22D2SyK3PKvgoqqqEZtFbGm9rBysodpNprEoI20c9JASRY8/K0HXlUiLpy/Ear2ZskIKwf2dVGSEslsGFzwgP5xkeye7Wj9B0BCmMxfC3YxDArHAlGxO+aogzl0VFo7+Khb3xikgzv80Euw87QqzyOT8RTSPxTIJJz65L+kXuPZepy24S3Z6sKO/JHJYGn5eJAsInEdQ7UBQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(3023799007)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vZCjk9V3ipcpwbNR6dqF4YfgWafJfaoMpnnEyII0qaJu3bCDNZPTsj/7hUaOZh59oVVHQ7N/weoKf/nRxzPrj+x03nqYnnFXMJEA4OrhbhxQhSxFTIFQJ1nD0Xi6D4GPshwx5hPpbJvxLrYCiWVJk+NYhCnY4LeGi3laW34vj2XMO6V1Lr4OFiqieo8akmhTp+YMvRCWrMYHet5npH4v22GdyPf2yDfWQrOtaelkU+J0r6R0DX0BXkyaG2nIBIGcJv+ZF2CA2BJSoy6LjrT1GtAik0M3hzRNsNMn24B6Wvvs2kbUaH37fDGUvCtvszKbNTLCmdjHC+jGexJivjWAJg3oA8xOtJlQSfSNNW0poRST5eCa9B5dgIr97esYrGGk+mXsx/7fjmkBwNRxKFpnkW5EjZDI8Ch4kL8/9hWeTltSdHWl1EvZCTQ3S+CMS/7V
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 08:13:37.3499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2916f5-aaac-44f6-3910-08df0b25966d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF0000006F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5788

GSP-RM needs the larger r000 vGPU WPR2 heap on devices that
advertise more than 32 VFs. The default heap is too small for the 48-VF
GB202 configuration and GSP-RM fails to start.

Select the firmware-defined 48-VM size from the detected VF count while
retaining the default size for configurations with 2 through 32 VFs.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs                      | 2 +-
 drivers/gpu/nova-core/gsp/fw.rs                  | 7 +++++--
 drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs | 1 +
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 4aaa46eb65fd..b82821f2a6b1 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -306,7 +306,7 @@ fn wpr2_heap_params(chipset: Chipset, vgpu_state: VgpuState, fb_size: u64) -> Re
         ),
         VgpuState::Enabled { total_vfs } => (
             u8::try_from(total_vfs.get()).map_err(|_| EINVAL)?,
-            gsp::LibosParams::vgpu_wpr_heap_size(),
+            gsp::LibosParams::vgpu_wpr_heap_size(total_vfs.get()),
         ),
     })
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index e6c0fac55bad..083066287dfd 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -166,8 +166,11 @@ pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
     }
 
     /// Returns the WPR heap size to reserve when vGPU is enabled.
-    pub(crate) fn vgpu_wpr_heap_size() -> u64 {
-        u64::from(bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT)
+    pub(crate) fn vgpu_wpr_heap_size(total_vfs: u16) -> u64 {
+        u64::from(match total_vfs {
+            2..=32 => bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT,
+            _ => r000_00::GSP_FW_HEAP_SIZE_VGPU_48VMS,
+        })
     }
 
     /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
diff --git a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
index 01e84dfc4b88..83105b37f317 100644
--- a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
@@ -85,6 +85,7 @@ impl<T> ::core::cmp::Eq for __BindgenUnionField<T> {}
 pub const GSP_FW_HEAP_PARAM_SIZE_PER_GB: u32 = 98304;
 pub const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE: u32 = 100663296;
 pub const GSP_FW_HEAP_SIZE_VGPU_DEFAULT: u32 = 609222656;
+pub const GSP_FW_HEAP_SIZE_VGPU_48VMS: u32 = 1436549120;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB: u32 = 64;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB: u32 = 256;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB: u32 = 88;
-- 
2.53.0

