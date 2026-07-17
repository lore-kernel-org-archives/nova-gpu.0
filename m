Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012045.outbound.protection.outlook.com [40.93.195.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBCA38759C
	for <nova-gpu@lists.linux.dev>; Fri, 17 Jul 2026 18:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784313643; cv=fail; b=WNvNkR/Rg4m+KiZ8zZlpPGaw/gzrCfk2d4McoYgAF36mdDtmAQj2ipdGpXhyCYj5K2H8V5dpYBAyixChe3ENfLLKn7UhllBuXW3S8MUanVX34FBHiGqm4WZnMLN7XC8pxhY055fvruvmcOvXplhsSVPGwuHHD4EyiKMMGAih8Uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784313643; c=relaxed/simple;
	bh=IoyLEJtCZUuSAnHkJuMggjlOru9zupX6NmrV072x53A=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=QtIbX+uGBn5c5zHb6cXi6doc0h5f9KM6xWJQHuBbH685YVCCuNe6F8T48yjwcmWJUqsie9Hsy1I1GURTS3wzFIfBUZXTk3hDdqqlLsGy3WfSKpvXDhgbiJvTQEjIYxSaacBx9Rq3BdKYK5XKLLgbXG+hE/lL/6yxmFnul7ttLUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JSezTIvb; arc=fail smtp.client-ip=40.93.195.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JSezTIvb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuUyrteTKC2yEekkROUcLJeHDyzAOIImc1BtNvWMpSSE+Z9s0DAORehNqf4FeIgXFk7FvF0W0fHy+IXNdg7dpL5j5AalWZbBfUqyAMU76eSIoJut0sHcZz4RTwy7m2njG31tSKoyryYVdyFeWu14FaDPZrGQxJXQzIsqohn3JaTKv6Pf9xhGVBFpZ54R73LZjvBoJq/KDEhbpXHpeHh1pM9l7+L9MOyE7QyDrUpHci974WQp1FOkK+QtU0gPjbT68ayciVQSJWlLRX5gPQZasxo1w0E5/hFoF2zXeTGrqXu9JpC2PRM4rFjM6kcvoMTt408kZkSwE8GEz5dDapS5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRSj7jDiiHHX2ZQnIiCG1xa4ke7Q9iiAPNe9QmCeBw0=;
 b=tp2NuhKs4S0LTj6elUqn24++y+QBj4J7BmSHfXLRAaoFxPtT6nWjvPVxUXLxPr/Om8v+vRSsS36WQsOkZwAY+DaYr3L+mBhF9UVYK8GPbbRCQvpXT3MXbcvXrBo+XvEXtjDkIY/9DXL9Wpqzpml9RsunmHJtI6TPRE3s2WY3lq+UxvpXknfoK0wD5kGUnZe0qjfqqn9tb93ezH+xKifLZkgjWKO3/8J23uOboi39T+aWGBJuR6buUoXkNZwwT73/uOU2Gpw/PxTeMhDnOuh3P/RehaSkupRsJccLeSyGMx7/l5eIqQH9XpbvuxKFQI/UUqG936aTfvTvklGUub9VAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRSj7jDiiHHX2ZQnIiCG1xa4ke7Q9iiAPNe9QmCeBw0=;
 b=JSezTIvbhOkaKUMxmpvZv14lQzjgKK0IfEZSxKZFZIohktdWCFRh52Fsc48htH1ya7TFI8tQTo00DhPUaOrvo+IhuBtOi4aZUNHCK40Te8l0oCSu/D5RCbc1oIHaLVX7kxNq1WqaBTIY6iBoa8F547cQT8JbtGLCCjtWZVZ1yvEgiVkLZuneTy0AasMMp9bTbUHj200U1UeOQnBNj8tLa4d8ODQvkFeP/XjC6xQoNIBIjWlm+TbUz+epS95aMpNUDKxmHSiGcL650tSBF5VHGjMzYwslcoGhTW1r2utjMb+sGFg9/QZZeMAaWPdyx7hyvro2AU6oGMk72D4FUE7d5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ1PR12MB6242.namprd12.prod.outlook.com (2603:10b6:a03:457::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 18:40:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 18:40:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 11:40:28 -0700
Message-Id: <DK12E4VG8GKN.27MC1C9PABT4N@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
 <apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <zhiwang@kernel.org>
Subject: Re: [PATCH v4 4/6] gpu: nova-core: add vGPU preludes
References: <20260709150206.1046839-1-zhiw@nvidia.com>
 <20260709150206.1046839-5-zhiw@nvidia.com>
In-Reply-To: <20260709150206.1046839-5-zhiw@nvidia.com>
X-ClientProxiedBy: SJ0PR13CA0168.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::23) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ1PR12MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5c75a8-ae5f-4e52-9c05-08dee432e049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|56012099006|18002099003|22082099003|3023799007|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ssbOmlCeQTK8M+299x7hK1SeT+WIV3Y+VOzKfKcPsMM4FT2MzkSGoFcMzZS//Hqh9WNX+rUg7Jx/CbOBwvFoDzHJabi5hwauW3iu5QtYRXHEgg80d+SiHpZHrP/jRjCZkOa6w+Ka2fSBvDFqdZZWDHxJQOOKVX0MpnpECdOSAGJyOSmCAAuGnxRQaY38mL8NQAuWtyob08OurNtatjD/lXh6odIjAbgB2eDLJQqpTDQiUh3OXu5vzTwyzST7KbbQqPAKWLV8W/K9rRyG0EP+ya8vwOMhPzdHzCJhOx1Tr1L8H2SpssH/yzEihZ16wT3bhm1ltGRVdTi/XZrwE9eJywrYQUkSDyikP5VnyzfjLwlzvjky1E3w/P7XfdYa1/SW2+UWOtLAFrnEmjzM8xBDT1y1R5PTY0oWV2t6rEuDOFEmo0D68rkoI+5f6lnghHEvaozYKYa0MBRBabLKmcNLb99BChrXIs1H1gQrkdaw3kJNu1vUZiVvjdFo+G4i8KScrysMQ+3ka4/bHhOlWlwjry+uIcfrIJqdbM5HisiCCurrnWDJF42tQ7Wxw8iOGHbzrXwR8Vkdg7kaaSGLPWHg0CCX3IJYhSCn0GrpWSEipBcfH/rakkKRGhQms8Xx/DhWAc7CQL/R7x5Mpbw/PGMWkU3yQNaH0GVlcV3Ha4UNrcI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(56012099006)(18002099003)(22082099003)(3023799007)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFU3TnNyWi9ZWldKdy9NNEVpVlpoV3dubUF6bnJ2eHNua1o3cDZndGZOOTBk?=
 =?utf-8?B?b1RXbUd0MEVHbFpLWHVSKzE4OEVsWHgxSTQ5Y0lmZSt1L0FvMHlBZkxMdE8z?=
 =?utf-8?B?SGdQTXJZOFozblBBZWY0VkZqWjA1Tm9SZlhCYVNqVVpTSzhYK0tnMTlnaWlh?=
 =?utf-8?B?WmlPRzh0RUcyNXh1TnVKcThBQTU5OW5OdWtYZkU5bHlycVlrUlI2enNwckV2?=
 =?utf-8?B?NGM5QXNFd0JiMDh3bUxYVU90QWFIYWhQRzhGTVAwSWpvWVBwQ1BpZkM1K2Nu?=
 =?utf-8?B?YnEzQXF4U3B3aTkrblQ3Z3ZMaDlNdkZmUFROZnJwdzVkZWxDd3FxRkNsNFo4?=
 =?utf-8?B?a0hIL3NVNmVjVUJ1RmlLU003Tm1yM2JNZDZNcHRBZms0L1EvcHBzVVBWdDZh?=
 =?utf-8?B?NGk1OFNHRHd1Wi9tUXZVUlVTSk1ZQkVmWHppcTVxOXl5RjJ0bTVNeExKZVZa?=
 =?utf-8?B?dm1ycEcrS0srQUNtZ09rSjM2bjhUaGFsQUprMVd3cWx6ek9VUENVYklLcGsv?=
 =?utf-8?B?aHN6T250cGI0bTZMQnI3dW5lUy9QS09WWm1aOVN1SzMyUURZZ0tnSTVFSGxw?=
 =?utf-8?B?NjJxbWNpSDBocTdMOHcvNWtvaXE4VWdKZEw1OFFiVVRLYXptVUQrcWdpVGQw?=
 =?utf-8?B?c21MOFNxNHJlWnNUcUdNSEtUZTVMMWhYdEFFMzFXektqMGFGNlo2NE1qVnRR?=
 =?utf-8?B?Z0ptQk9xM0F2RkI4cis5b1N1cGNyNDdCUmd1S2lvdVg1V0RtSVZ1WWx6ZTlK?=
 =?utf-8?B?QXBGL0lPV3VzMUN4OEU5REw0OWRoODFBNlcwa09mTXZtYnJSUy9DTzNIVEhp?=
 =?utf-8?B?bURyYnNNUFY4ZDYybk1ndXlDdHQzNXkxQjlFSitQY0htMXExWWROd2ZuQ3hy?=
 =?utf-8?B?Mzk0a2JQcVFudGxGaWx0MmZWNEl1V21SQklRckVzZ2tsQ09FOFZWNmU1dnNX?=
 =?utf-8?B?RVdiQXlEd0l4Q2hBbFJ3b0tZVHl6Z0tJelNJd2lIZXQxU0FDdi9NU0VEa3pR?=
 =?utf-8?B?RmxkL3NTV2RBbjRQTkV5MU5uUWM5QWEvcEEyUU1wcEZCMUt5UmthdDF0M0xr?=
 =?utf-8?B?aGNoN1o2anRpTXU1NzYzcTRFN0ZRMGtwaHNjQXAxTWVLdlJ4c1R4TnNDOVBk?=
 =?utf-8?B?VXFzU1cwN1ArT1BwbGZUcmxSZmlqdTlCWVdMdG1hUjA1aFMrTDhsQkEyRTIw?=
 =?utf-8?B?eGh6OVduOEdhVjNjVUhpdURsNGZnSnRZTDYwalRQcjZhNkhSQlN6OHBtZkxw?=
 =?utf-8?B?bVZIYmx2azFnLzdxSStVQUN6dzA3SzFkYlZoazRrbUw2TURGWXd6bUFvSS9N?=
 =?utf-8?B?VzhucjlTY3BUQmRIRlgybmh6ZlNEMndVWVF6T1R1NTd1SFdiMEY2Z0ZvWWdX?=
 =?utf-8?B?NE5MZWUrcDhrYXJkazBWU3Z0OHAvUnEwUDBkWkVxUit4emtMTUF3VGkrZG05?=
 =?utf-8?B?ZkdGenZIbGN1Mk9JMjNKam1WaEx0ZjNXenRnaW1RQ1JwWjQwb0NRanJOZktQ?=
 =?utf-8?B?eTkrSXdJb1Y2Yzl1c1YvV20vMGM1cUZ2YUk4bnl3ZE1WYkdRM2c0dlNSUDF4?=
 =?utf-8?B?c3pJeEgzUVR6UUlvMmt6OXlrdmF2d1FieU5jMmFMRUJrQS9wbkRBblNyV1dH?=
 =?utf-8?B?Sm5PaTdDZDJTNVNuK1hGanVaVzNhOHlwanBGZVBXd002OXFZbnpWN0hKRnhC?=
 =?utf-8?B?eU5vRElxMHpaV2hKdzJUYlJ3eWdMbk1yd2NENnpWWUthZmNwYUozSkxzUVF2?=
 =?utf-8?B?YkpIVUJsQUVqOSt3SWFpaXhoeU9kZVhaekp1c2NzOEY5NE5nLy9iYUJYUmsx?=
 =?utf-8?B?NjRFQllXTVpjOGl6UVA3d2NDTkNZQzlMaHJDa2xLbm92YmlxR1BrS3J4aVJw?=
 =?utf-8?B?L3BGdkdFeWU0QUNNYVpVZDFDTXplcUdpR3BjN2ZYS3pZNThSSTVVVjFkYU54?=
 =?utf-8?B?SFloV2d0MlVHOU43WHFYZm5aQm1nVzg0TmhZcWRFanZKTVZSc3g0MW9xS1Bl?=
 =?utf-8?B?WVNJdUtCaG9QTzZrUXpsanVmdytPd05XS09KQ1VnTkx2ZVRUNmRWSzZlclE5?=
 =?utf-8?B?SGxyemxORzBFKytBNWI1V2I5Tzd0RlJuV0VVVkI2bzhqOG5mWFMxUE50QXRi?=
 =?utf-8?B?Zm45MUFBaEpCOVhFUFAyYmF5QnhVTXBjaE02dU5kSzNjOU5iYmg3Wll6MWhL?=
 =?utf-8?B?VUNVbTR2ZTlJTitRNWo0NU9UQWV6cmpwYnRldGZ3WDc2bytLRHU1SjRDUnRu?=
 =?utf-8?B?ZjBXbXNhdDZ5L1BzeTNnRFBCVEpNUGJVRmVHV25kVFJWUStvRUtjQml0cnBk?=
 =?utf-8?B?NXQzNmFUTit4VHlyTXNYSmlFVHI2RGFSRHdxWkd5VDNTcnoxSTlaUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5c75a8-ae5f-4e52-9c05-08dee432e049
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 18:40:29.8539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUDPoCOlGcqRyeLL1a6yJcSWbj7BGkNpfMuEArdBnXs8zjnb04ybnw6vtIP4ERJjGQjTxkapBQYr/r+yifkzwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6242

The patch title is a bit vague; maybe switch it to something more
informative like "detect and store vGPU state"?

On Thu Jul 9, 2026 at 8:02 AM PDT, Zhi Wang wrote:
> GSP boot needs a stable view of vGPU state before it starts building the
> boot-time data structures that depend on SR-IOV and firmware policy. That
> state must be derived once from the PCI VF count and the FSP PRC vGPU mod=
e
> knob before booting GSP.
>
> Add VgpuManager to detect and retain the vGPU state during GPU
> construction. Keep the manager separate from the detected state because
> later vGPU milestones will add vGPU resources and lifecycle state to it.
>
> Keep the vGPU capability gate local to the vGPU module with per-chip HAL
> modules. Treat failures to detect the optional vGPU state as disabled so
> they do not prevent a bare-metal probe, and log both the failure and the
> detected state where the manager is constructed.
>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/nova-core/fsp.rs            |  1 -
>  drivers/gpu/nova-core/gpu.rs            |  7 ++
>  drivers/gpu/nova-core/gsp.rs            |  2 +
>  drivers/gpu/nova-core/nova_core.rs      |  1 +
>  drivers/gpu/nova-core/vgpu.rs           | 90 +++++++++++++++++++++++++
>  drivers/gpu/nova-core/vgpu/hal.rs       | 25 +++++++
>  drivers/gpu/nova-core/vgpu/hal/gb202.rs | 15 +++++
>  drivers/gpu/nova-core/vgpu/hal/tu102.rs | 15 +++++
>  8 files changed, 155 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/nova-core/vgpu.rs
>  create mode 100644 drivers/gpu/nova-core/vgpu/hal.rs
>  create mode 100644 drivers/gpu/nova-core/vgpu/hal/gb202.rs
>  create mode 100644 drivers/gpu/nova-core/vgpu/hal/tu102.rs
>
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index 3a6b02f0dc11..abc161c4ba96 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -487,7 +487,6 @@ fn send_sync_fsp<M>(&mut self, dev: &device::Device, =
msg: &M) -> Result<KVec<u8>
>      /// Reads the active vGPU mode from FSP using the PRC protocol.
>      ///
>      /// Queries FSP's Management Partition for the active vGPU mode knob=
 value.
> -    #[expect(dead_code)]
>      pub(crate) fn read_vgpu_mode(
>          &mut self,
>          dev: &device::Device<device::Bound>,
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 442c0979f9c6..42a4cd7971fa 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -30,6 +30,7 @@
>          GspBootContext, //
>      },
>      regs,
> +    vgpu::VgpuManager, //
>  };
> =20
>  mod hal;
> @@ -267,6 +268,8 @@ struct GspResources<'gpu> {
>      // TODO: use different resource types for each boot method, and make=
 the relevant Gsp methods
>      // generic against them.
>      fsp: Option<Fsp<'gpu>>,
> +    /// vGPU state detected before GSP boot.
> +    vgpu: VgpuManager,
>      /// GSP runtime data.
>      #[pin]
>      gsp: Gsp,
> @@ -311,6 +314,7 @@ fn drop(self: Pin<&mut Self>) {
>                      gsp_falcon: &*this.gsp_falcon,
>                      sec2_falcon: &*this.sec2_falcon,
>                      fsp: this.fsp.as_mut(),
> +                    vgpu: &*this.vgpu,
>                  },
>                  bundle,
>              )
> @@ -364,6 +368,8 @@ pub(crate) fn new(
> =20
>                  fsp: Fsp::try_new(dev, bar, spec.chipset)?,
> =20
> +                vgpu: VgpuManager::new(pdev, spec.chipset, fsp.as_mut())=
,
> +
>                  gsp <- Gsp::new(pdev),
> =20
>                  // This member must be initialized last, so the `UnloadB=
undle` can never be dropped
> @@ -376,6 +382,7 @@ pub(crate) fn new(
>                      gsp_falcon,
>                      sec2_falcon,
>                      fsp: fsp.as_mut(),
> +                    vgpu,
>                  })?,
>              }),
> =20
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index d89cc3ba7c72..164bae8b8524 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -49,6 +49,7 @@
>          },
>      },
>      num,
> +    vgpu::VgpuManager, //
>  };
> =20
>  pub(crate) const GSP_PAGE_SHIFT: usize =3D 12;
> @@ -67,6 +68,7 @@ pub(crate) struct GspBootContext<'ctx, 'gpu> {
>      pub(crate) gsp_falcon: &'ctx Falcon<'gpu, GspFalcon>,
>      pub(crate) sec2_falcon: &'ctx Falcon<'gpu, Sec2Falcon>,
>      pub(crate) fsp: Option<&'ctx mut Fsp<'gpu>>,
> +    pub(crate) vgpu: &'ctx VgpuManager,
>  }
> =20
>  impl<'ctx, 'gpu> GspBootContext<'ctx, 'gpu> {
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index a61406ba5c0b..35a8b1214b0e 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -23,6 +23,7 @@
>  mod regs;
>  mod sbuffer;
>  mod vbios;
> +mod vgpu;
> =20
>  pub(crate) const MODULE_NAME: &core::ffi::CStr =3D <LocalModule as kerne=
l::ModuleMetadata>::NAME;
> =20
> diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.r=
s
> new file mode 100644
> index 000000000000..fcc15bddd53e
> --- /dev/null
> +++ b/drivers/gpu/nova-core/vgpu.rs
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{
> +    device,
> +    pci,
> +    prelude::*, //
> +};
> +
> +use crate::{
> +    fsp::{
> +        Fsp,
> +        VgpuMode, //
> +    },
> +    gpu::Chipset, //
> +};
> +
> +mod hal;
> +
> +/// vGPU state detected during GPU construction.
> +#[derive(Debug, Clone, Copy)]
> +pub(crate) enum VgpuState {
> +    /// vGPU mode is not enabled for this boot.
> +    Disabled,
> +    /// vGPU mode is enabled for this boot.
> +    Enabled {
> +        /// Total number of SR-IOV VFs supported by this device.
> +        total_vfs: u16,

Patch 2 returns a `NonNull<u16>`, which is the correct type - can we use
that type here as well? Since a value of `0` would mean `Disabled`
anwyay.

> +    },
> +}
> +
> +/// vGPU state manager.
> +pub(crate) struct VgpuManager {
> +    state: VgpuState,
> +}
> +
> +impl VgpuManager {
> +    /// Creates a vGPU manager by querying SR-IOV and the FSP PRC vGPU k=
nob.
> +    pub(crate) fn new(
> +        pdev: &pci::Device<device::Bound>,
> +        chipset: Chipset,
> +        fsp: Option<&mut Fsp<'_>>,
> +    ) -> Self {
> +        let state =3D Self::detect_state(pdev, chipset, fsp).unwrap_or_e=
lse(|e| {
> +            dev_warn!(
> +                pdev.as_ref(),
> +                "vGPU state detection failed: {:?}; disabling vGPU\n",
> +                e
> +            );
> +            VgpuState::Disabled
> +        });
> +        dev_dbg!(pdev.as_ref(), "vGPU state: {:?}\n", state);

Note that you can just use `dev_dbg!(pdev, ...)` here (also applies to a
few other sites).

I believe these will be my last nits for this series. :) Thanks for your
patience.
