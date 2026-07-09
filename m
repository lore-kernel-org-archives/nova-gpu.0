Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010048.outbound.protection.outlook.com [52.101.193.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7645F370AF6
	for <nova-gpu@lists.linux.dev>; Thu,  9 Jul 2026 14:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608024; cv=fail; b=euzdBl+O0nSJWFpnOPSbZ24DDdMkH1px0M3aSG1BStj3pXfu+UAF8CHQXLLATQOUKXxZMfqSh6UBqBKeZ9hFzWimJHN29199vtDvYrZzuyYo2cgvNuJX3dXKf3v6gSUXVn3sbk4XbbUOpu3lcqGjvbJA1YOh5v3fNBQWfTBEals=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608024; c=relaxed/simple;
	bh=Xancf7s3V8JbU/yfE5/IZwaxPu2Wi1opBkEsvpmc7u4=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ozKiDuXjkS/Itx/YjwL56FjVly2ROpqZSnQMaPA04bdK6nNzGOR94iz3ab5n9NjAKWXv+jRB1/gtCFx3bLRYVDciQuDwDUwxB0Zyli8GGMwxuRAp/1zlYSwJrCgh7WgCmB5lAn3u+011I3wBbsqk/PLcM0XY4NBPVENkqqgo6Zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SNHss6ok; arc=fail smtp.client-ip=52.101.193.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SNHss6ok"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IoG6qGJpA1/gKRXtcortiD7FzzoirLkI3LXESzZhCdxbZKlrF6tVChAZtJ8eq75DFLm76sMgaM/2BG8VtPRJa5dX7zf6yut61FbQBmpFQ9R+hSmF12hAz6pltrgE5PiyI3b4b8WzstaqPQOcnn+sD2JAmLLClR+tUpKhYy/tXpDJkpxM387/6k4ANZ2Lu1DWN98DJnqlFwoavwzJoGD/B5BWF7SPaLmyk+1YVAkZlz1hzmbobBnqeOY/9k6BetvtSxREAUrbCTcDigSs3dQlVlS8FD9D9PybbaVYY0rphxH1JUNL+OvUg+MwfMuCMPI8GvYsCL6vxiz7tgGTBxWI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UaBrMFx1yy4H9KWEkE1SvHv3r4n46L0viUnaXNMFcyg=;
 b=qTJfKMu2i9Q0PPHFQ0uTvDQOaQ6vy1F5+i2BIIZs2x45zLv5gTfXDmmW094pYVo7dmhwgBIEzl2mXmuKMCu1yhuk0JOs0DaS+m5M+y2/uJXlhGG+UGO26pvQhbEPTTF2/wcLXOLZ5vPO8CBvvCyWW0xW/yqSiVrRN7kmGFJp1PJYlpAPtxcwRm7zaEuoD9WwjPki9HsGuoZrvc6oAaUinBfK5PTrF/v008toiqIOEqF3KYMqVVA/QKtEPbT+P9Cpwk6sJUN3kS+FmwjkbXPHhIjf6Ll8WhUxyN0OYMNq5ytv1v9xNxWe2IDYi7mF1t3EEU+292BMggpwAUm2DyY9zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaBrMFx1yy4H9KWEkE1SvHv3r4n46L0viUnaXNMFcyg=;
 b=SNHss6okzfqx+87lsrvJNRC2xZ/CG9vytHt4uCLkgAs9JcWF+lTQGFqNQWmhdxepo1qB6NCx8YzWQTjVIG7Qoa7Zyvw+ou49t/xPJUkfG0gyJ8RqqTohVWX7XzmvuKianj1BidurmRABf4PZOvjJAIYo1xWfkk0UKKkInkJA9pzrhOUjB69kx1xA8toYCkj2spVrGU5J4+yUH8WcCBe+WNgdrxwI9H3/3vF35dl1yQ9MSNdnUb0ZH4qJgNEn4C/+VkRhuuxlkyh5STmdIUBTBjwLiL785kK7+Cg7iwubhxKePKtjwC0uTULeanlIpHIbeRwK1QZfw/fAJpb1XrNO3Q==
Received: from PH7P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::31)
 by DS0PR12MB8816.namprd12.prod.outlook.com (2603:10b6:8:14f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 14:40:16 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:510:338:cafe::a0) by PH7P223CA0026.outlook.office365.com
 (2603:10b6:510:338::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 14:40:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 14:40:15 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 9 Jul
 2026 07:40:00 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 9 Jul 2026 07:40:00 -0700
Received: from inno-dell (10.127.8.14) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Jul 2026 07:39:54 -0700
Date: Thu, 9 Jul 2026 17:39:50 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
	<gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
	<a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
	<jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
	<apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
	<kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
	<aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
	<nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<zhiwang@kernel.org>
Subject: Re: [PATCH v3 5/8] gpu: nova-core: add vGPU preludes
Message-ID: <20260709173950.27ddb442@inno-dell>
In-Reply-To: <DJTSH1KINGX5.2LY0DQTNX8DEU@nvidia.com>
References: <20260701062622.3499033-1-zhiw@nvidia.com>
	<20260701062622.3499033-6-zhiw@nvidia.com>
	<DJTSH1KINGX5.2LY0DQTNX8DEU@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|DS0PR12MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: 832e7271-e7e7-4835-bd33-08deddc7fdb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|7416014|1800799024|6133799003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	N7tIM8qXPaihutg3TBh0zRrXafsZ6t2ezX1JUqX+bgpOTYd48BX0k9bwrq5ePM4kHHsNnkqWXBYca77fWP1stqrrL/GHK6q6EO1V9MGlJXA6TLuDeOccaf/uAukF0mwwDadw1GXpw+xfEQgSG+PnaScU/f+O1DYlijkJ3QoqXZMGqoXfrFMCku2G8WtrQLos0sdMB7Vg3w+z97LATbMsE4+PUCARA9GQ+d6i2xaXR9NGNcncSlWLn1eFi9OmwPnQVVlHDt9JqcGLWUqQ5mUryFlG9Gf5/mZ7p9W+5/aC0xns3EyrcLbqzCu1DtvzM81jScC8WRQpNanyBiRnf6UbmOFw1yjwNWgBc1YJYcQ+ufmxGYkEmlc/v0NNcZ4jJtAQCUsjExDntfC1S3QVI8aAMr08nOCayAh56zXbNQM0I0MatW9H07WSD3DB1/TzcYdtb745c8/aRhThnUTOZ+zcb09FWg2eI31kV11HSN1JL3OWUlUueXOGoaJI1N83p5hxHp0RnXli4pHAhW069c+i3VnAPItFlRU0qz9yQtEwX8IkO79oTmlTvyVEwKLkrI/tBHQh92F23oMJnq1SaLphB6ciKOKw+sN5oyPLYi0Vt9/gmq03A38toxMY4bnVD5McUqZrBkO0YTZRsIXDDAB5ThlyjRLfAuUPxl3+STsJXRXdXW9vubyEkEKba6y4uebZyOhfqJEZg7+lZOxTqLzCkA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(7416014)(1800799024)(6133799003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cRBxjcj0OaKBVZvBDVOOkR1b+LTszpAh0lhMrjlGZ9O5UTtIRZnPk2KGsuujQt1FaVTWZzZhZDaSwbB7LdjPkxpEQGuNzHSnC/6PoTFyECAHdbXyoTYrDZ+MVg6XEFfevzkzYtbsSKBnIMEUclGKfJVt4i+rtb0LZO7b22CBV8otx77yrNTgv+yYvclF4QMYH5ArPja7f57f4bd4RBkQEHANHpec4KP9vJRP6W4RRucOgTpMnJaP+fyYHE2enPwzB66m5tmaekFJg2qjwS/JW9Mk7/pLJE077yedqx1ucAlfKSf0j8HLd8ecW4Tjq+rQSkYxzUQBEcDKsjeOXUqF6maw4a5gFUk19h69r/zsBAKsKFWPXmt8suC5R1fms/tc+kayhTg9CBYGJjAYBrPrjqDHnKVPyITQQ5i6CLLYdFjHK//aomCvhq9r2eCHYBL6
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 14:40:15.6927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 832e7271-e7e7-4835-bd33-08deddc7fdb8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8816

On Thu, 09 Jul 2026 14:25:25 +0900
"Alexandre Courbot" <acourbot@nvidia.com> wrote:

> On Wed Jul 1, 2026 at 3:26 PM JST, Zhi Wang wrote:
> <...>
snip

> > +/// vGPU state manager.
> > +pub(crate) struct VgpuManager {
> > +    state: VgpuState,
> > +}  
> 
> Just to confirm: right now `VgpuManager` is a wrapper for `VgpuState`,
> but it is going to grow further in the future, right?
> 

Yes. I have some example code here:

https://github.com/zhiwang-nvidia/nova-core/blob/zhi/nova-vgpu-wip/drivers/gpu/nova-core/vgpu/mod.rs#L62

It should extend more when more features are coming besides the current
functions.

> > +
> > +impl VgpuManager {
> > +    /// Creates a vGPU manager by querying SR-IOV and the FSP PRC
> > vGPU knob.
> > +    pub(crate) fn new(
> > +        pdev: &pci::Device<device::Bound>,
> > +        chipset: Chipset,
> > +        fsp: Option<&mut Fsp<'_>>,
> > +    ) -> Result<Self> {
> > +        let state = Self::detect_state(pdev, chipset, fsp)?;  
> 
> Do we want to return an error (and make probe fail) if the vGPU state
> cannot be detected for some reason? Or should we prefer printing a
> warning and returning a `Disabled` state? I don't have a particular
> preference but thought it is worth pondering.
> 

Good question. After thinking for a while, I think it should be
'Disabled'. E.g. if the user has updated the vBIOS and the PRC is not
there, we don't wanna disturb the booting flow. Let me update this in
v7.

> > +
> > +        Ok(Self { state })
> > +    }
> > +
> > +    fn detect_state(  
> 
> Let's grant a short documentation to this method.
> 

Sure.

> > +        pdev: &pci::Device<device::Bound>,
> > +        chipset: Chipset,
> > +        fsp: Option<&mut Fsp<'_>>,
> > +    ) -> Result<VgpuState> {
> > +        if !hal::supports_vgpu(chipset) {

snip

> We typically don't create functions for each hal method - let's make
> `vgpu_hal` and `VgpuHal` `pub(super)` and use them from their caller,
> like the other HALs are doing - `fsp/hal.rs` is a good model to
> follow.

Sure. 
