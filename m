Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE23E347536
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 19:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787252484; cv=fail; b=i7lxhDTkMAx9tuKH+WRmjUXX6jYjkDAfYVUVsvUsRMWzKEctFNx4e7y9/KRdeRwsyUlpZE/rKlo5Em0vxQSPWWhHK3y81nCHAFN50vfmb2O5pVSdsKFZDbLEXMmxKNbItIlbH9UUaepYXBYBd1APaQ4JMdlJ22ph8s/2M6+KSbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787252484; c=relaxed/simple;
	bh=d4QTxfRsa29DOHAoxdwkvntmze/UFvVjpQHYP7sEpPU=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BVbGHmm3kS4UfcWjXtcz+EW3IvxGWLydCuZjLgGzgfukAX3OduJC12qhH3qSoz88X6cTiEr2xP45Y7yRYDlmoN6UfGILGuv8lfkmZlK5rLgNxekBbaYD5wHbNp7tCKlG7s5qxzEnY3VVxfxbqYpoBMZLnC18pQdtJRsLqwJHUCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TsdM6tWB; arc=fail smtp.client-ip=52.101.62.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TsdM6tWB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkbuSLv+A/4/lDvTI3KT3KqOyOqO8INtDhQxLXZZgfZrT4DwysoByURsnZqZK5USw6t6fxwdHn8FsfOUwzUC13MiMVPcNuXbNGripsJDOl1E5LmeDii/YPd5t/z2Noj+07AH4gbtqMUqtXELQyqhz2Ejgk3oB4lJa4g/n4CmItjZiF3bMbLp2aiW1JPShef0ytV5uVrj4sqZ6av/WNz4oTRWYTWh1ZzQdcl6GyTvflwPkE6TVz2bm8A9d+2SBOwb4oUCx7MdrdE0NCNrxkQKUu7FXc0tNABdTfAcUc08Q4yb+srpVIObOAGdvfbctdJzCF6+i5GIL4qTk5NXyFKT6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bO5SFby7vcBT4fWYOoFco/xl2Ak9nabWGnpujKOI950=;
 b=LpvByZaX0uhWGouRGqcPVwa6hueda7FHsTcxPVJdQF4Jg12nI+vrFYrkCk+THCW+RJT0np5Na0Ei0m5OgPGBCoJTe00uwFR1flfFDgXRhkUY0oyL+m+gziaou/p6C8vUlMI9EveZH7aR/bt5Aq8GCBgQXINx78n/9jjeWau9sepCUMSKikhsvDnVcObWCh1E6pB0Ot5hl3PSCt0uC/dtXrj8vgUwuss1+1uWQHVQo4tx55rOQ3h3yBh1cVnwcGTcminHXqIM5dJqlLrYZuQDoVlgYFiXysALZzdF1CNLtz/hcpzGNsSwOjp8d7OXkcKT6Qs4n512fCxH4GKrr2MxoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=umich.edu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bO5SFby7vcBT4fWYOoFco/xl2Ak9nabWGnpujKOI950=;
 b=TsdM6tWBqpA4ayml0hzduIK6l34Eq1S/QQD8F6kDkuX+rsh9MAJ2GruY5MYaGhozVrH1oi+5FnqXtM+dN6QLTTZrBou5GW+939nYFLN1BrBCuy2TWUYSBHsfSgiE6CfG8/lcqCe0hmjbdPUQdsHLKh32894kLvLd7MpWHWkowhk6hsdtQdYBxtkir5GaCjzI565h8bG3mZTxhKNxw+Oiw6RxK92tkfd5bGpigFYTAJWhpEVWTmrzvNdKSIFvUDDyTXUUxBElxwj3CrvfyzYMPOlKG5Lg2SDr4nAJTHsiVOeZhcdpYBzNIK1CHeKMDWthGUdImYmWLKjGWRN9Pj6Ejw==
Received: from MN0PR02CA0013.namprd02.prod.outlook.com (2603:10b6:208:530::27)
 by CH3PR12MB9343.namprd12.prod.outlook.com (2603:10b6:610:1c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.9; Thu, 20 Aug
 2026 19:01:15 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::9e) by MN0PR02CA0013.outlook.office365.com
 (2603:10b6:208:530::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Thu,
 20 Aug 2026 19:01:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 19:01:14 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 12:00:51 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 12:00:03 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Thu, 20 Aug 2026 11:59:58 -0700
Date: Thu, 20 Aug 2026 21:59:56 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Alistair Popple
	<apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas
	<bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
	<alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, LKML
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 26/27] gpu: nova-core: gsp: remove the retired
 system-info and static-info RPCs
Message-ID: <20260820215956.35ec589b@inno-dell>
In-Reply-To: <20260819035221.336390-27-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	<20260819035221.336390-27-jhubbard@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|CH3PR12MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2a5bbb-0c98-4b26-757e-08defeed6863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700016|23010399003|82310400026|10067099003|11063799006|4143699003|56012099006|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GUIqyHFppirkO9gZIEqMg76UUEdqKl4zSqDAbZyBw/5F593eQzyJxZwfm4eGGh0yUj5EDHZe8XaAWXZWHtaUBrbiyygVKyAQYe+ZlTH8P8+en0xcJ88IatgEOJpaoqLH4oNUSg/Qi7e5hpcIsbNsLpQ/eOdsFe19cnCctweUG9XVq0czjXPw04UviadT50m5gCiLN1iNhv1hHnYir/Itsi8J1+mvx41tZRzjQ28Mf/DvTSYcZ5q3AA9Lqb2rQGc5sHeip5W1rwdTB0LJ7HhD2XgNTu5lIs4Yg+dKuxmISZy23nqO+6k57kMrdcBsTyQ572jXYMKsI6iP+QeAAgR/V8V/kdF0wAVh9gSQuYD3Y0FSQ47E3/KSEBG/QsWYw6ncEf4lwHTPvS5SAua9e8iYdwsJjJHRyGUTwWo3lozFI/04U8NET5r1gGaP4bfYrBX5lDw4q1S8+mbnUqfU14FJGSBqZHZGS7O5GQfy0SYSrY3PWFDMu+VX0XEdn5t+vjBfUxTZmq2qcb1JZ3wZQio+ql8PEvxz9TRizSMuVBMIZ4Mi5Rc7WdRuVsEU3s94im665+/7o9WmKhyvqOIPC5rKaBsNWAtXXJ6cSljXgKGqf1DXSyq2f7cumjrpLzOZtpn27xNK6rvWiCwC4pUsdz2MVmoMYibon2SsvucLfvtg4NraV/QCNqyr1ju1A/wfydbvdxkGg4iO5z9om5OG9XiAtg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(23010399003)(82310400026)(10067099003)(11063799006)(4143699003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tfWFX1QJNA2+DkXjlEnGUzWlyHVmMYxotgMtg9jP1n3EXXvbhneEnpCzy5M+Bri2qo+XIn3mdzJPSmjIi6P+jKlfXTvdeSez+x4A6ezAUFLxGAFyZnFwKX/4UBkFq6ixyT0Jwe/JcscMgYssNfvmSpbd7D0FMfgZErGAycG5QICYELyM+VvDzhqw0imO9RMiNFvUu9NNWNBqcKWMdMqIWQ/UBJKExhq3BfdkAugobxI0jEW+iobQBVOQcoNn7Gs21gRl86WKhVx70YgTYCnqJbsql93kxAz05qtr5f4z7lYEXaWRRyUsPwmBvrp2XJwjfi+6LHYv77Qfvhv7cugFeiz3BEBP/8tiRfPZB05OQbFlybGce+u6oiI/G8Wior2/0eW4F9nmFq0d/7PmMosiArQAPTn5t9DMCQLry3cmdTF8HIGo/8KhIjpkV2vewGZQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 19:01:14.3444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2a5bbb-0c98-4b26-757e-08defeed6863
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9343

On Tue, 18 Aug 2026 20:52:19 -0700
John Hubbard <jhubbard@nvidia.com> wrote:

We can remove SetRegistry in gsp/commands.rs and gsp/fw/commands.rs as
well.

> The r000 boot path folds the system information and the static GPU
> configuration into the GSP_INIT request, whose reply carries that
> configuration back to the driver.
> 
> The set-system-info and get-static-info commands stayed behind after
> the switch, unreachable and marked dead, along with the two payload
> structures that encoded them.
> 
> Remove both commands and their payloads, and keep the decoded static
> configuration that the GSP_INIT reply fills in. The two
> message-function entries stay, because that table catalogs the wire
> protocol rather than what the driver implements, and already names
> many functions nova-core never sends.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp.rs             |   8 --
>  drivers/gpu/nova-core/gsp/commands.rs    |  65 +------------
>  drivers/gpu/nova-core/gsp/fw/commands.rs | 115
> +---------------------- 3 files changed, 3 insertions(+), 185
> deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/gsp.rs
> b/drivers/gpu/nova-core/gsp.rs index 8e912eaf8e2e..b128153fda86 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -407,14 +407,6 @@ pub(crate) fn new(
>          })
>      }
>  
> -    /// Query the GSP for the static GPU information.
> -    ///
> -    /// The r000 boot path gets the same information from the
> `GSP_INIT` reply instead.
> -    #[expect(dead_code)]
> -    pub(crate) fn get_static_info(&self, bar: Bar0<'_>) ->
> Result<commands::GetGspStaticInfoReply> {
> -        self.cmdq.send_command(bar, commands::GetGspStaticInfo)
> -    }
> -
>      /// Returns a shared handle to the GSP command queue.
>      pub(crate) fn cmdq(&self) -> Arc<Cmdq> {
>          self.cmdq.clone()
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs
> b/drivers/gpu/nova-core/gsp/commands.rs index
> 26ea07dc4a28..9079393da0b3 100644 ---
> a/drivers/gpu/nova-core/gsp/commands.rs +++
> b/drivers/gpu/nova-core/gsp/commands.rs @@ -49,34 +49,6 @@
>      vgpu::VgpuState, //
>  };
>  
> -/// The `GspSetSystemInfo` command.
> -///
> -/// The r000 boot path folds this into the `GSP_INIT` payload
> instead. -pub(crate) struct SetSystemInfo<'a> {
> -    pdev: &'a pci::Device<device::Bound>,
> -    chipset: Chipset,
> -}
> -
> -#[expect(dead_code)]
> -impl<'a> SetSystemInfo<'a> {
> -    /// Creates a new `GspSetSystemInfo` command using the
> parameters of `pdev`.
> -    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>, chipset:
> Chipset) -> Self {
> -        Self { pdev, chipset }
> -    }
> -}
> -
> -impl<'a> CommandToGsp for SetSystemInfo<'a> {
> -    const FUNCTION: MsgFunction = MsgFunction::GspSetSystemInfo;
> -    const IS_ASYNC: bool = true;
> -    type Command = fw::commands::GspSetSystemInfo;
> -    type Reply = NoReply;
> -    type InitError = Error;
> -
> -    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> -        Self::Command::init(self.pdev, self.chipset)
> -    }
> -}
> -
>  struct RegistryEntry {
>      key: &'static str,
>      value: u32,
> @@ -186,48 +158,13 @@ fn init_variable_payload(
>      }
>  }
>  
> -/// The `GetGspStaticInfo` command.
> -pub(crate) struct GetGspStaticInfo;
> -
> -impl CommandToGsp for GetGspStaticInfo {
> -    const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
> -    type Command = fw::commands::GspStaticConfigInfo;
> -    type Reply = GetGspStaticInfoReply;
> -    type InitError = Infallible;
> -
> -    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> -        Self::Command::init_zeroed()
> -    }
> -}
> -
> -/// The reply from the GSP to the [`GetGspStaticInfo`] command.
> +/// The static GPU configuration, as decoded from the `GSP_INIT`
> reply. pub(crate) struct GetGspStaticInfoReply {
>      gpu_name: [u8; 64],
>      /// Usable FB (VRAM) regions for driver memory allocation.
>      pub(crate) usable_fb_regions: KVec<Range<u64>>,
>  }
>  
> -impl MessageFromGsp for GetGspStaticInfoReply {
> -    const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
> -    type Message = fw::commands::GspStaticConfigInfo;
> -    type InitError = Error;
> -
> -    fn read(
> -        msg: &Self::Message,
> -        _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
> -    ) -> Result<Self, Self::InitError> {
> -        let mut usable_fb_regions = KVec::new();
> -        for region in msg.usable_fb_regions() {
> -            usable_fb_regions.push(region, GFP_KERNEL)?;
> -        }
> -
> -        Ok(GetGspStaticInfoReply {
> -            gpu_name: msg.gpu_name_str(),
> -            usable_fb_regions,
> -        })
> -    }
> -}
> -
>  /// Error type for [`GetGspStaticInfoReply::gpu_name`].
>  #[derive(Debug)]
>  pub(crate) enum GpuNameError {
> diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs
> b/drivers/gpu/nova-core/gsp/fw/commands.rs index
> 00e40a435053..e49234f35d0f 100644 ---
> a/drivers/gpu/nova-core/gsp/fw/commands.rs +++
> b/drivers/gpu/nova-core/gsp/fw/commands.rs @@ -14,11 +14,7 @@
>      }, //
>  };
>  
> -use crate::{
> -    gpu::Chipset,
> -    gsp::GSP_PAGE_SIZE,
> -    num::IntoSafeCast, //
> -};
> +use crate::gpu::Chipset;
>  
>  use crate::gsp::nvkv::{
>      nvkv_decode,
> @@ -37,56 +33,6 @@
>  
>  use super::bindings;
>  
> -/// Payload of the `GspSetSystemInfo` command.
> -#[repr(transparent)]
> -pub(crate) struct GspSetSystemInfo {
> -    inner: bindings::GspSystemInfo,
> -}
> -static_assert!(size_of::<GspSetSystemInfo>() < GSP_PAGE_SIZE);
> -
> -impl GspSetSystemInfo {
> -    /// Returns an in-place initializer for the `GspSetSystemInfo`
> command.
> -    pub(crate) fn init<'a>(
> -        dev: &'a pci::Device<device::Bound>,
> -        chipset: Chipset,
> -    ) -> impl Init<Self, Error> + 'a {
> -        type InnerGspSystemInfo = bindings::GspSystemInfo;
> -        let pci_config_mirror_range =
> chipset.pci_config_mirror_range();
> -        let init_inner = try_init!(InnerGspSystemInfo {
> -            gpuPhysAddr: dev.resource_start(0)?,
> -            gpuPhysFbAddr: dev.resource_start(1)?,
> -            gpuPhysInstAddr: dev.resource_start(3)?,
> -            nvDomainBusDeviceFunc: u64::from(dev.dev_id()),
> -
> -            // Using TASK_SIZE in r535_gsp_rpc_set_system_info()
> seems wrong because
> -            // TASK_SIZE is per-task. That's probably a design issue
> in GSP-RM though.
> -            maxUserVa: (1 << 47) - 4096,
> -            pciConfigMirrorBase: pci_config_mirror_range.start,
> -            pciConfigMirrorSize: pci_config_mirror_range.end -
> pci_config_mirror_range.start, -
> -            PCIDeviceID: (u32::from(dev.device_id()) << 16) |
> u32::from(dev.vendor_id().as_raw()),
> -            PCISubDeviceID: (u32::from(dev.subsystem_device_id()) <<
> 16)
> -                | u32::from(dev.subsystem_vendor_id()),
> -            PCIRevisionID: u32::from(dev.revision_id()),
> -            bIsPrimary: 0,
> -            bPreserveVideoMemoryAllocations: 0,
> -            ..Zeroable::init_zeroed()
> -        });
> -
> -        try_init!(GspSetSystemInfo {
> -            inner <- init_inner,
> -        })
> -    }
> -}
> -
> -// SAFETY: These structs don't meet the no-padding requirements of
> AsBytes but -//         that is not a problem because they are not
> used outside the kernel. -unsafe impl AsBytes for GspSetSystemInfo {}
> -
> -// SAFETY: These structs don't meet the no-padding requirements of
> FromBytes but -//         that is not a problem because they are not
> used outside the kernel. -unsafe impl FromBytes for GspSetSystemInfo
> {} -
>  #[repr(transparent)]
>  pub(crate) struct
> PackedRegistryEntry(bindings::PACKED_REGISTRY_ENTRY); 
> @@ -136,60 +82,6 @@ unsafe impl AsBytes for PackedRegistryTable {}
>  // are valid.
>  unsafe impl FromBytes for PackedRegistryTable {}
>  
> -/// Payload of the `GetGspStaticInfo` command and message.
> -#[repr(transparent)]
> -#[derive(Zeroable)]
> -pub(crate) struct
> GspStaticConfigInfo(bindings::GspStaticConfigInfo_t); -
> -impl GspStaticConfigInfo {
> -    /// Returns a bytes array containing the (hopefully)
> zero-terminated name of this GPU.
> -    pub(crate) fn gpu_name_str(&self) -> [u8; 64] {
> -        self.0.gpuNameString
> -    }
> -
> -    /// Returns an iterator over valid FB regions from GSP firmware
> data.
> -    fn fb_regions(
> -        &self,
> -    ) -> impl Iterator<Item =
> &bindings::NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO> {
> -        let fb_info = &self.0.fbRegionInfoParams;
> -        fb_info
> -            .fbRegion
> -            .iter()
> -            .take(fb_info.numFBRegions.into_safe_cast())
> -            .filter(|reg| reg.limit >= reg.base)
> -    }
> -
> -    /// Iterates over usable FB regions from GSP firmware data.
> -    ///
> -    /// Each yielded region is a [`Range<u64>`] suitable for driver
> memory allocation.
> -    /// Usable regions are those that satisfy all the following
> properties:
> -    /// - Are not reserved for firmware internal use.
> -    /// - Are not protected (hardware-enforced access restrictions).
> -    /// - Support compression (can use GPU memory compression for
> bandwidth).
> -    /// - Support ISO (isochronous memory for display requiring
> guaranteed bandwidth).
> -    pub(crate) fn usable_fb_regions(&self) -> impl Iterator<Item =
> Range<u64>> + '_ {
> -        self.fb_regions().filter_map(|reg| {
> -            // Filter: not reserved, not protected, supports
> compression and ISO.
> -            if reg.reserved == 0
> -                && reg.bProtected == 0
> -                && reg.supportCompressed != 0
> -                && reg.supportISO != 0
> -            {
> -                reg.limit.checked_add(1).map(|end| reg.base..end)
> -            } else {
> -                None
> -            }
> -        })
> -    }
> -}
> -
> -// SAFETY: Padding is explicit and will not contain uninitialized
> data. -unsafe impl AsBytes for GspStaticConfigInfo {}
> -
> -// SAFETY: This struct only contains integer types for which all bit
> patterns -// are valid.
> -unsafe impl FromBytes for GspStaticConfigInfo {}
> -
>  /// Power level requested to the [`UnloadingGuestDriver`] command.
>  #[derive(Clone, Copy, Debug, PartialEq, Eq)]
>  #[repr(u32)]
> @@ -369,8 +261,6 @@ impl GspInitRequest {
>      const NV_DOMAIN_BUS_DEVICE_FUNC_KEY: KeyId = 0x1020;
>  
>      /// Describes `dev` to GSP-RM and asks it to apply `regkeys`.
> -    ///
> -    /// The same identifiers reach GSP-RM through
> [`GspSetSystemInfo::init`] on the RPC path. pub(crate) fn new(
>          dev: &pci::Device<device::Bound>,
>          chipset: Chipset,
> @@ -442,8 +332,7 @@ pub(crate) fn gpu_name(&self) -> &[u8] {
>      /// Iterates over the FB regions the driver may allocate from.
>      ///
>      /// A region qualifies when it is untagged, unprotected, and
> supports both compression and
> -    /// isochronous access, which is the same set the RPC path
> selects from
> -    /// [`GspStaticConfigInfo::usable_fb_regions`].
> +    /// isochronous access.
>      pub(crate) fn usable_fb_regions(&self) -> impl Iterator<Item =
> Range<u64>> + '_ { self.fb_regions.iter().filter_map(|region| {
>              if region.limit >= region.base

