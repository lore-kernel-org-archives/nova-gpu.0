Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011050.outbound.protection.outlook.com [52.101.57.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39AF35674E
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372221; cv=fail; b=OIOlS/kprbt5l0EivieGN0aQBvVkeuV/wTEj+2Ao3GSElQoqB7crm6aw0iLdZF6mN8ChTFA4HAYXHCktfO1Jc6HIfCJJ2Zi9XPFNH6IxNzxZi31lxkjlgCuKpdbnqKyo9gD+lAZOvgGe/O2wkO6sRIe2FdnM1ck1BmQt1NbqtK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372221; c=relaxed/simple;
	bh=Q3mPPQzSXCMB+VEPZduTd85jTMNrNfgUfF8LecZJyw0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kiPuGw6IkyjCPV9iBtvHFgW4Yxp0jqZxiIBVv0A3obojvwisT1Cdc1qMQI30MYlwfTZbmYRvw+xEDsSKb4v+/4njWZWqs2Xo40r79ZO2GuEJz32st10RyJLMi6/3CqbKPvvpNlds1dGBaa85Cg1PzGBVcr9Rug4y6jT4euh2wOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d8qgTn61; arc=fail smtp.client-ip=52.101.57.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d8qgTn61"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lgtv29ZXZdSDZuK2w76grd58TMN+lgSd/VZf+fzOPamBpoIUDN76m8X0ZWDch5hTltrv9Dm375I9JoAwcqwgKC3GlhFhtCZEuYdWJndIS6ekLwix8ik7qVpV1GjoKtxjDNY6w0+hopOk2AzptrbhtTt+yCrikn5VAuxNnY/5vFpCwP+SPCga5lcLMBMmpOnw4gFW6Dsg64h1CNStcLk8zP4ABg9ZKCtIr+cTwJwdLGjOK9lN6dNh8lDtJDtH4NjpVlafdV5qKCm92hxmSQeVg/IhcoOgmlg7wAviH720TDuda472wNLPAUPnvRfoCh/7NEtJsB5EQGCX8zqFpFQhJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5BHFcA1CSyqLUyrWG27+J5Yagirz1BkuE6vcqFrY4A=;
 b=pVHc/V/7mLPivWb84/pLKf6sJYnRqFlHASVPs6fApoavpGj7k1fWFxwJmdZ2wUgZbsKKIUdR8W/gPED57IUDuuDZyCte3o97GFmvcvqd9ngW75kqXfU9MUytU03mLNY8Rnqq/T1jNWZnO0FD9hGA7Hns2sWiJtrlzTq7DdSgqWvq5rz63MnOCcXf+Eveq7tI1Osbx2a8N/r2RKRdUvPQEc9Gmx0SvZAfslOAfKQv6y46vzBblDiYq6Xm6pvrqqJ56iohTK6oz/uw/MvRoxlmBQSOqelHxG+BBKXXDYnKUSECEyvjdtQdorS9rxVF5OxB+jUjzVYLcRoEqDmJQEAz/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5BHFcA1CSyqLUyrWG27+J5Yagirz1BkuE6vcqFrY4A=;
 b=d8qgTn61BQuwXvISkG7W653lGNmlH3p0YV1jbegVFZsulBArRNI6afL8xN4AZeA6k+ixAreZ0nWOZUkcOrZGIfPDynRXtoUb+0Hh3KTojqYGLjxUYrq+cbmGYxLKTzL8GxqKKRWTtrDdAJSxJTl5rzztJ7cWRauDwiaBDK9NMND4PP17pB77jKw1IweYmJeUgwLOgoPZJGAT6qHS8XfVlS3MRVDdUb1VgDeLHkrQr8BDwD8byLaO1beA6oZrIxfH4TybidF0VHk1nzNZVEW8RhyTr+Km/GDCvnrOmg92m3tkzNRlBm6wX6hWsnxvCj057C9SewespZxxenNvL3DdcQ==
Received: from BN9PR03CA0508.namprd03.prod.outlook.com (2603:10b6:408:130::33)
 by DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:50:08 +0000
Received: from BN2PEPF0000A892.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::7e) by BN9PR03CA0508.outlook.office365.com
 (2603:10b6:408:130::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:50:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000A892.mail.protection.outlook.com (10.167.248.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:50:07 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 00:49:54 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:49:53 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:49:46 -0700
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
Subject: [PATCH v2 04/32] gpu: nova-core: gpu: add a channel ID pool for vGPU
Date: Mon, 14 Sep 2026 10:48:39 +0300
Message-ID: <20260914074907.1399629-5-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914074907.1399629-1-zhiw@nvidia.com>
References: <20260914074907.1399629-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A892:EE_|DM6PR12MB4435:EE_
X-MS-Office365-Filtering-Correlation-Id: 283df39b-fc6f-4a1a-b930-08df1234cbf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|23010399003|36860700016|7416014|376014|1800799024|82310400026|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	uMQ8uJ9E4FzgRSc7jWQQpl5on6f5cfigPUMu/Wm7ERwV6l5rSGudjbCCpt67/+peKccrGyRbQXuZe+V2WFCTfFaIJNQ2UgHrQGQK6lOjdy7RzIrNnH32lVueONeX4J/Xqi+MyK7Lv2+CajR6fMH1ZgmJinx0N2dOEYFZ4MqmZXUdaAnApklZLWV+0sgXCoiGAbZ2fx9lr8TbwldngTdXl05ixiXRsk0nnsws1bNJxZvA5IOlL6Qjqb+lZgOMYuJNe7y81vRrL/r5TQXAr5YiwHkBosmfSG4NsP56ugatE0AvkagqPvS4gH1QoT0AI2xOivssZNel0h6NoH0zd6JB7ah95USXRODRU17IV3Im4zZiQlNKQA4jgvFhQrPgZtw55GmR9ZabvgH1kAv47Cpcz6uMX2nbkhFeu6HGKJCj6FwURuaem8JEuOdCNHju4nLFJtpRN5fnusuZCSufGWQUlPaE185oWK4ydIm5IKM/YV1Jr/UEkZI0R5O5IYcm2fzEJKAqivkOQFM19uWVIOQe0CI48pVjXI0m3fuymgoIXBwLZMqT7VqpMCbfHdBpOX4sEdU6sTNDgkB3/PyZvTbR7mL8RH+drXqvIMJ1FbvXHSMB8x5hogEbQ/SYKU7yZzxHYI0NNz4g9viueyzbPcHL77unwFhahZGYg3LQ7brJIeV99XIeFRHM6Vh8qKMI7OPqS94iT041MzBd4bAv/dkTIA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(30052699003)(23010399003)(36860700016)(7416014)(376014)(1800799024)(82310400026)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RoUd2AoGhWp/L1K8QdAodLHguGckppoRWzo9iUc5rw8uiC3PzlE/s2ZmKwN6CRW2TfoIj5RhkHw+Vy3AGk08BrCh/yJPDB5gjlB5X6ywCwCk2AIHAJ+bd9oCuO1cehDbNOSwcoFbtQGhL+upSrqgwRFEl0kt/+WPS11/DurODmW7sXOtlAAPeZT9Slv2Zgg+fGki6uXcoFbpPbJfe4/kFMm7vY7YJ/Y2I6V/BWpVBENuWSQmsZPvgf9k49BTlX1gzCbojQv0msCGK1icYgAWlIiWtOk5K7WoKzczOZtrfvpVlMh2r6DX8k/2q6RsMkZ0hB9s1bSQRgVacoAsqFBnrzH/gKcSb/mYztM8+00FFPW1xT9i+s0aF8KBJ6p0+mMTJHvnpgplsAFevm+1ClKo5RviFlqyobORUZ2otwxNIgK1xzq7e+YNrfrSOTJq4job
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:50:07.7241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 283df39b-fc6f-4a1a-b930-08df1234cbf0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A892.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435

Channel ID reservations need a GPU-owned pool shared by vGPU instances.
The existing allocator is not instantiated by Gpu, leaving no common
pool from which consumers can reserve per-VF ranges.

The pool must remain at a stable address while its reservations exist.
Its storage also needs to remain available throughout GPU cleanup.

Create a private pinned ChannelIdPool with a single 2048-channel
capacity constant. Initialize it before GSP resources and declare it
after them so that it survives both their normal destruction and
initialization rollback. No channel reservations are made here.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Suggested-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs         | 9 +++++++++
 drivers/gpu/nova-core/gpu/channel.rs | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 39e9e4ab0be6..733a2c09ec01 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -48,6 +48,7 @@
         GpuMm,
         VramAddress, //
     },
+    num,
     vgpu::VgpuState, //
 };
 
@@ -56,6 +57,10 @@
 mod hal;
 mod regs;
 
+use self::channel::TOTAL_CHANNELS;
+
+pub(crate) use self::channel::ChannelIdPool;
+
 macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
     {
@@ -322,6 +327,8 @@ pub(crate) struct Gpu<'gpu> {
     /// GSP and its resources.
     #[pin]
     gsp_resources: GspResources<'gpu>,
+    #[pin]
+    chid_pool: ChannelIdPool,
     /// System memory page required for flushing all pending GPU-side memory writes done through
     /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory-barrier operation).
     ///
@@ -396,6 +403,8 @@ pub(crate) fn new<'a>(
             // Initialize this early because `gsp_resources` depends on it.
             sysmem_flush: SysmemFlush::register(dev, bar, spec.chipset)?,
 
+            chid_pool <- ChannelIdPool::new(cv!(num::u32_as_usize(TOTAL_CHANNELS))),
+
             gsp_resources <- try_pin_init!(GspResources {
                 device: pdev,
 
diff --git a/drivers/gpu/nova-core/gpu/channel.rs b/drivers/gpu/nova-core/gpu/channel.rs
index 485efaba059d..75666c6768e6 100644
--- a/drivers/gpu/nova-core/gpu/channel.rs
+++ b/drivers/gpu/nova-core/gpu/channel.rs
@@ -21,6 +21,10 @@
     }, //
 };
 
+// TODO: Query the channel capacity through GMCAPI once an equivalent of
+// NV2080_CTRL_CMD_INTERNAL_FIFO_GET_NUM_CHANNELS is available.
+pub(super) const TOTAL_CHANNELS: u32 = 2048;
+
 /// Pool for tracking reservations of channel IDs.
 #[pin_data]
 pub(crate) struct ChannelIdPool {
