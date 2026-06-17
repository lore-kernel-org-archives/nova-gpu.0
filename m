Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011066.outbound.protection.outlook.com [40.93.194.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE8C3C9EE5
	for <nova-gpu@lists.linux.dev>; Wed, 17 Jun 2026 08:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683662; cv=fail; b=dqJgpJ0o3Aj7toVZ4d5HfXWhgJOmc0RfmXn/VkgcdqgJttkUzCgwkrkC/FuMXAMvLHajBT+GjKqt3E+wtgPAIw4OVkxjpLdqRdsVTxebbu4L8wIWIl2q18C+Nxo/ETRGIUaktnPsvZO32XQRDctdzlaH2r7CKMrwW2WTOmwuN3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683662; c=relaxed/simple;
	bh=LHwC0L3+L9xOgTNQ+P599uRLTUB8qVuwR+wA20HVsDs=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L7ULfKjznGKZSojTrw+oCw62oUPi7/371ny/fB5hRrWrZK1pT0MK9zI44h+sG9MLvPlW+fp607PT6uIGiwkfUrIi/XX37SpauSJJ7v+9XSBtSAjR4Y7QYNLBRVVfePdYepvnM4megkjM5Mfu0fLncjZ6qXaVNFLj+Vidw6PQenA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YG8kP5MK; arc=fail smtp.client-ip=40.93.194.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YG8kP5MK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAbQvTB67WJJIWTfVmrJSUxlZGrHZ9nmlIwDIXlCqyY45IlqKRnL/6PacycgmwA3e1tZq51nIoK0F1gGdUXLaTydysXewShRe+WcTnsVptGKw2aHQs6i8sLE/HZEdTRIxkpKS2wXFOfYZn+04k2Pgwu3G6Eeo9xlFRTI4ldya0CX4pZJHuYk6mnp8eTEyWtBwAFzg4+jgntgHsnwCg438v9TaJlk9BAq+bwqDfgiDUkOX/pnGyL+cJutlNAeukF8xW5xbA4HC81wRP8QHxAWdNKnP6a1hhOhNTL0thhG2iE1GDyhB0bysdgE81rnO/vCb1/U9gWKeI3Vs/qQldTq5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhkHzECCLmGNqiA6NEQx48enQp2XLnlaGss8l3Hb4Ig=;
 b=CXB/PrHTdk13iNX9ccLdHgR6JODES0Qra4inz+MZRPKdGO3UA/kVg2R/CH7iGh5ydMt6Srv1pzN/KUGeECRzBwJG7fPHuQ4EeTt3626/Iq5yiW67hiJTnCg2q/qA0I6FP3cX2aqeAE50R9UYDVRpCxmyFORf2463mgYGA/b6k5S+vPQ+mwQd5VOJsB3qhxgpKBaNhyH7zeWE3rGdaUeJGAuw/tVafsT2Ow4LMtHFS1CZMT895fYXaq1X0bnBJGNP0W+wfUjcMRWVEhDskmzN2ghSmlYKbHrVEKilFaTvXr1ibrMWSzbb959Dly4FvZVhK/Q7zM40hE1Q56WtRLtzYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhkHzECCLmGNqiA6NEQx48enQp2XLnlaGss8l3Hb4Ig=;
 b=YG8kP5MKbL3941sNbBuX8x+fJhcqh3gqYDQWUpG/6dgdrBBrU7K9rrB6dg+wk2QL/k58WxBaUD5gReQwWQguueVCMauQPe4MqXGCE4PMW1s943GdagWoZRH0NtG2TiHX17yNupHwq3dEA2dfF1Ost0rBxhLjwfW40XqreSd8wAbYynGks/EyOApvK8tupRZpH+aVciWgBpKcL1B4c9Zv9GlnVoIle3oFSNFL2VqKeXwXQwtPcskFs+ZWev6uLMC/vQ8BtWPM5LnFyANqdhkqa874VGTCVe4N0qE0vlOEKxNS8bnJdf28rywh1BzvqjUWYoHgOJIeNJXnf/1B39viPQ==
Received: from BL1PR13CA0116.namprd13.prod.outlook.com (2603:10b6:208:2b9::31)
 by PH7PR12MB7353.namprd12.prod.outlook.com (2603:10b6:510:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 08:07:34 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::4e) by BL1PR13CA0116.outlook.office365.com
 (2603:10b6:208:2b9::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 08:07:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 08:07:34 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Jun
 2026 01:07:28 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 17 Jun 2026 01:07:28 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Jun 2026 01:07:22 -0700
Date: Wed, 17 Jun 2026 11:07:19 +0300
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
Subject: Re: [PATCH] gpu: nova-core: reserve a larger GSP WPR2 heap when
 vGPU is enabled
Message-ID: <20260617110719.7736f80c@inno-dell>
In-Reply-To: <DJAJGC4LLOK3.YAX75103O00O@nvidia.com>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
	<20260604114339.1565660-10-zhiw@nvidia.com>
	<DJAJGC4LLOK3.YAX75103O00O@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|PH7PR12MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 543c7fa3-abbc-436c-d28a-08decc477d10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|7416014|376014|36860700016|4143699003|11063799006|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	U7Yl9dWlXgYZVjjwuzrkzskyMY8srIRfRJLcnLRejvkI5mXs3AGFLf0vTpxPT+K6Gj8B3+dKBDbVfJNhtpRJFGvC0Wxks7hV9iBRQd9s3X07ZfwxL1EpnN015IEmi+nZt6dhtf3TfX924WlOh5hC1hCUxmRe2eGVy9AY6oIwXtr3W6GNl6y4N8uPLDexXTvcgoxVTLSqd/XcSyZqgYk+VC7349vrmONvrS94AnkScEQYZ2JPBoM7BZj3bgCETWhp78ceJOCBWQOtArLTxOQnD1xtwdDgQT9bMttYozTCbqn3qK4oaXpq1SYg+QWEc7JFJd1GJZzPod/svRjaUuoBfCn7uf/c2HRJjkJ12zg4RX4welD3NkubXxk0snonvfm31tgF39l3iymXyJ4ru4R09KprgQQA4+joj60QnZKGQ1QsB58v80KcTqpZpzluLrB6HcCg5JmKbxPyHWttultNATcMaAjWHC5m0LpSgPBV7a4qUCydkgls7w9Fr5v8ErqDEBz8YlYUDVhiE0o7RZTGLdHEJgu3n4QTHnOqusX1HiGPxQ4KRZFpUFR4oCjZVlBPCWDYdQknTxljoFMDaztgcURNSLTsEJxSbiejXIuvznPJNpd9Z0thwiP7y5NDiqsaPl6lVDjttwlfxlnHOtkeYjRGpGlfu6av1g1NPbN+IYt1qWDJcAaZlXq4Xrqr6YqReyf/UHUD+Euhq5rEIK6YxRqNNo71cK5Ez3lYbmzko+s=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(7416014)(376014)(36860700016)(4143699003)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dGTOozY5qtnPDbmjBIXu8aKtluWsG4fJgGGabRV6gw7hr5rJaDuQsElHgi9n4jzCc78OmLF+si7VbSmJZTytDOkcZXoIiSugxEc9lTzk2iLzhbJHJbmGYXk9V9xUV7o+yTt+Ft2y5dvv0OKItnCj61VEtZi9nz87z9X62ZD2fCoXZB9cg0UsSiBNkXCMDHglQC+KOTcRlaLOF7N0V9jQ5XQpXgdVTjpXhXGqmvfopc/AKsCyWsK50fENDXUsS5NISU3GYSsyrYXVop66AydQ2CnSKtnwpiI3xaJjbg4YZLL2UKxx3iNC5O97kjzBDBPSV56EuNjfB0hvjkdxhk8gEAttn5BkW9oYZBRY1glpHXw729gnI7LA+0qeNoiBEIOh8h/GILVYuGM7hQGVTMM1i04SpCOZrsWmdWt/xjgGwqdM9d+wwnsH8Gxk0wrxpK/1
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 08:07:34.4295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 543c7fa3-abbc-436c-d28a-08decc477d10
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7353

On Tue, 16 Jun 2026 23:20:41 +0900
"Alexandre Courbot" <acourbot@nvidia.com> wrote:

> On Thu Jun 4, 2026 at 8:43 PM JST, Zhi Wang wrote:

snip

> 
> `total_vfs` is only meaningful if `vgpu_requested` is true. So these
> two parameters would be better modeled using an `Option`, or maybe
> even better a dedicated parameter type for vGPU settings? Something
> like (please pick a better name if any):
> 
>     enum VgpuRequest {
>         Disabled,
>         Requested {
>             total_vfs: u16,
>         }
>     }
> 

Make sense. Let me try. 

> > +    ) -> Result<Self> {

snip

> > diff --git a/drivers/gpu/nova-core/gsp/fw.rs
> > b/drivers/gpu/nova-core/gsp/fw.rs index 14424a2c2d83..2f3cbc5d5114
> > 100644 --- a/drivers/gpu/nova-core/gsp/fw.rs
> > +++ b/drivers/gpu/nova-core/gsp/fw.rs
> > @@ -101,6 +101,18 @@ pub(in crate::gsp) fn
> > advance_cpu_write_ptr(qs: &Coherent<GspMem>, count: u32) {
> > pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =
> > num::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX); 
> > +const GSP_FW_HEAP_SIZE_VGPU_1VM: u64 = 174 * u64::SZ_1M;
> > +const GSP_FW_HEAP_SIZE_VGPU_DEFAULT: u64 = 581 * u64::SZ_1M;
> > +const GSP_FW_HEAP_SIZE_VGPU_48VMS: u64 = 1370 * u64::SZ_1M;  
> 
> Do we have a source of truth for these values? I can see definitions
> for `GSP_FW_HEAP_SIZE_VGPU_DEFAULT` and `GSP_FW_HEAP_SIZE_VGPU_48VMS`
> in OpenRM (meaning we could generate bindings for them), but cannot
> find a reference for `GSP_FW_HEAP_SIZE_VGPU_1VM`...

I see. Let me remove this one and we can add this when OpenRM has it.

Z.

