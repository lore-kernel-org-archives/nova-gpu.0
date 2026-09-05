Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010061.outbound.protection.outlook.com [52.101.61.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED83C37E300
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 13:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616539; cv=fail; b=EFTfRcZm5NALSKZaYMN9tacgwQpp99jzCcZ2j/fiEw5ZVQkmT3pkia+O6whoDW3VSqW6N+Z8dkhmm/xIhe53++70ZS8IB08ukVZLveFOcUtRoaS++yVp1IwXpl+29CF79sicV1r4Ul2ESoJYfOCmOUXocT8iffj6WKRDIjlL5bk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616539; c=relaxed/simple;
	bh=up6NYwO/zhjaYR3zTa+fqI9EmQI7sRkx/yGqc3pPro0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Fb7crfElmGJiIJ+94PA++8p0Abszu2yWcJkCr/15omWIvBUzGwXLKolUsO4cK6rDYcz7jqxPdfw8od9liL0BzfDZFRvdi1U21skkkbQkHJss2y/R67wGAsyBnO+mHnAaszIzjlGCxmGD4En8cV8k/EK4lNcgd8CaHYDKCRB+sKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hs1jl2LW; arc=fail smtp.client-ip=52.101.61.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hs1jl2LW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXsWBOxOsJQd1tD2GMEFyhNb5IWva8gEOxRXo1jFUXfS2igGRsZSevGy2lz2n1Cwn5Av/RxeSedTB1B8Hwv82SmSwH/AG7uX5IsWMoDDyqoh1BF+lYZXCeTZAZFJYqkD9GgR+7ArWI2a6yx7ipZPnAgkp0U554U+a3t2hWJ5z5WErdwdrlrhZocLkHS5jyYr1vUVp1KfIGtuf3vORdG/bvb/LsjXLqNCZJCaaH6/qolasVjkMaPRBiDrLMMjAfq2Nk3O65PIyqA+drhUefUOub8c+hOLXBmqwvzdhrjO31tdj8Ak5Bu1muUIelMt0WUY4JM6rmLqH311w0m8Ivew1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTMK0biSPcFqW0L5fhk2w8qAC09lfs24jG1U0EFKQwE=;
 b=JQ4Dxn/rkyoq5WuFLLuE/BRCN/wnBsZeG0W1v191//vDoKxYqIrjwK4J82Pn3nYox1I7ELqYLLmu2KnB/POWkWUTRablvQMyqUu0c3gj2BI7liFOwDPHiAa0Ez0u4HQ5Z0RsGeXqLcDD6a/kwkVoSkZWW+65bzRh0AmyZotaf9hYBr+OMN1RUJWdDGYlABQDu4KauzqgeVMf/AgPU6CkkGUrLIoc7+TsqEfZMpafWlyvF3UhX0po2IXRUp1AhtfPe24HXpz6fsNeUEMDdwXq0GlaY8l9UMziX8MYr0h9XmaQlVfvqEZPcYImD4Z+A5iF4tJEAWUQ40cao95P7wswJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTMK0biSPcFqW0L5fhk2w8qAC09lfs24jG1U0EFKQwE=;
 b=hs1jl2LWeDUXnHmdRIIUgg+fU7qU7TUze6aQghgeEJ9stJluBl+hh/sNADJoKLpJgGjRjgxjdDKVFynyjIz9joEdnUmqzD4AAOn7zbO1Us1AkHz6jhwM3rVmner23cZxq/1esUP4EGuybX4aQsGr0i6b/e2Jnuk35/XiVFfESw1FyIKkiPr19sLvvQ5ni2s2YqiaujgcnBd3/a7lhgGHqDhlLnZsQOfZKMcKvvkKfeMXOJV8lNU/YULdmfCa0R2T/8uPWjeL60rmtC0nt+QN3Zmk5Q6DDwyqNdFy+EURL7uxNjVB2qZuOJmvpVeOMi/qSRj2SxjeKCjfC6Je+rahHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CYYPR12MB8750.namprd12.prod.outlook.com (2603:10b6:930:be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Sat, 5 Sep 2026
 13:55:31 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Sat, 5 Sep 2026
 13:55:31 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Sep 2026 22:55:28 +0900
Message-Id: <DL7FN5S6RSRI.JDTB3MREKFVA@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Will Pierce" <wpierce@nvidia.com>
Subject: Re: [PATCH v3 06/14] gpu: nova-core: add the GIN interrupt tree and
 allocate its vectors
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-7-jhubbard@nvidia.com>
In-Reply-To: <20260903031514.1515905-7-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0259.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::7) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CYYPR12MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec0184d-b60c-4a57-e8fa-08df0b555973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|7416014|23010399003|6133799003|56012099006|10067099003|5023799004|18002099003|4143699003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	qckInpce/J2H4NYMzxTKVY7ZRoE5kJge0jH9fIIDqL9/PD2sophmYzi39CVNxu4ERluBGprTrvUrqRINTUERovxwzFpi5ccSACy7ibXIUWNANjLh7HJzHwcfvVKmTvDVtaf52WDpbc6y4cqfNOkkpYDFn81FLXBZKjjTJ7hdUWLbF5MHRyEE6WP6dwr4QBwc2u9BXZU0go+9K2bkSyCpDK+qb0ufgLk3rR0zuf+45tE5iKiH0x298vnQbXEMOnMkEhxt+95rCbCRHNmaw3REQQ3NbpoejQjFnjSIiUpk2Qxw8j96BjFmo8eNfOj+5n3R3jShMaTTbaR2vZstZlgJbC262sjOpJfYdzOkT7IlUAjCPvNV+jB0WFPZELo1YKMvPKNL5SMiNWudnLOQHCp4SZMoaaS+G3AxyDbg3G5Ug90Ip7lKjUo73kPa0oU7M+mN7bcFdattMpLR7Y2L3WYWQQoaq0MIoE7+jtVBCSuMxoCODsn3EV6Zvm3aS2jy3nPwkLs1lLau1G5NeZ94HOnoeHB/z+ave1a4W63xevJUt3GxvJmL5z4T7K9kNXt+TdQC6Yo3C9WP+9w8anHppFUCT0ECXjj5KcFutjyhdYX3IMbnDSt3MN8Dsogr3wfZKryvso9gS27lMv4V4eQAYpfSSS6cqcqWofkDB1NLAQLlaUE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7416014)(23010399003)(6133799003)(56012099006)(10067099003)(5023799004)(18002099003)(4143699003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2pHWWc3S0FtOS9kOXZEcVM5QkU4THJmdVI3Y3JyT2EvbDBjK0xDWHN5b0VB?=
 =?utf-8?B?UzU1clJ6WHFPdERrL2JYcjVmaURtMDUxcEhKbGpoOUIzanZDdEVRdDY5QVlI?=
 =?utf-8?B?dUt1bDgxTEhkRHhzZkM1Mnp2RFMrRlJkNFNsMmFxQm14SzNYTDg2RUMrQi9w?=
 =?utf-8?B?cmV4blpNRCtQNjFSZTBrV09DNTRhdnc5dnNIeW53UU9ER00wMmlKSUFVbUQ5?=
 =?utf-8?B?dW9meXFLc1RBMC9HODViZ1pqL1ZiYUxoOXQvb0lGbVF5aWRFMVlNRmg5enkr?=
 =?utf-8?B?QjJSVnB2MlRXdXhyQkdlVll6bDlCSjVLd2Nna0pjL2ZDSGdKSElKZkZRT1dh?=
 =?utf-8?B?VXkyeGozc2JTU0hTUmdUTUtqTjJQdXQ4ZkRWU080bzVpdEJ3bVY1dHNrQ3pF?=
 =?utf-8?B?WHRsTkttSjlERTZHS1c1MEVoeEJMOFRLbkhPSnRzbVB5dXhyUmNHQ2lpQ0Vj?=
 =?utf-8?B?RjdoeldDTVR4Z2FvZkN4Wm96VjVEM083aHc2bWdxam9abU5Qcks3QVhlaTN3?=
 =?utf-8?B?WGhmQjFHZWZJVzdDYSt1a3drV1ZzMXU2RE9wY0E4aEVPbjBmQndKUWo5cTl4?=
 =?utf-8?B?dXE5WTh1WEdIcVJsaDdZR2dLNFZrOUcwb0tYWG5IbWJ2TUtHbnJLVit2emFE?=
 =?utf-8?B?NmgvNkNXNmJreHR6Ymx0N0tuTGJOV0xmN0ZQNDZUbXRrWXFCYS95M05jVVFJ?=
 =?utf-8?B?T0JtaE8xbWNFcWJGTDljYkFrVG5xc3dxZ292d2xMdmNZMHA3b3JIL1dlSGN5?=
 =?utf-8?B?VmJLd2pyZDByM05qajlBRzNZWW1oOW5TUTJaaG95OEpORUkvQ3VkdW1peGJs?=
 =?utf-8?B?bFBuczBvVmVuWFg0ZEhnd0F1RFNiSWM4UzhVNkdQd0Q2OFMzQ1pudzY2azBF?=
 =?utf-8?B?TTFKTC9oOXNZbDZTM2ljcW1kYnZ2U1pzRDRuTDhiS2FKaUpCbWtuL1V6M0kz?=
 =?utf-8?B?d1kzR3FjQ3ZjeW1WNXBISWhYcEJRRTFwRGdocFY4aEZQRjlxb1plUEwvODZt?=
 =?utf-8?B?TEhRc0VpRTBxdzRCWUNTVnVaYnVuVlkxSklaSzM3M2xLdmFMWUlCakZML3Rj?=
 =?utf-8?B?VEtDU1ZzMGRZcUdJVjFyYjVPZnBDbVE0ZUx0VWFKSWs0ZCtubWZhdkl2V3JD?=
 =?utf-8?B?N2o0OU5RcmU3VDR1Rk8xL0tYQ3FmRG8ySk9IRmhvUFBTayt0c3VnUnU3aGRN?=
 =?utf-8?B?YnVhRDB0V0tkbmp2Rm1Rb09OMk5RL0JVdGRCd3BlUCswcnp3Umh3WHY2bFIx?=
 =?utf-8?B?WGJHcHl0NlpPL1dONDdtSlNmR3Nob2JRQVRMVXVoekxFam4rUUo5djZSVmFS?=
 =?utf-8?B?ZEFBaU5DM0VhVndEYlVIaVJhVWZmLzhkdXNFNGhrOG5BY0ttbFFQd0MrRjJH?=
 =?utf-8?B?M0p5dVhLQkhjdG04aVRhdzAxcEtWeFMrazgwNlc0QjhNY3hlaThnOGJhTVZp?=
 =?utf-8?B?YWFDVE43RkYrN1cyclNFMHFMMFJic25wMm1WRWIxeXdFTTVwaU15SVl6akxD?=
 =?utf-8?B?Y2lPSFVPbVJqT3B5U1UrTHRISjRyUVg2cC9mdmI3S2lMNVpWWlRSR3JPU2Vm?=
 =?utf-8?B?TjZmRFZJaWEyQXJSVmZiVGgrSFpnSVRxUGRLd0NaTUU5QzJ0VEdQQlJwTE8y?=
 =?utf-8?B?NkF0TGRrS2psMjJ0cXZNZS9INktWN05qMDVqVCtxck1yc3VTVW5IOHNnQVFy?=
 =?utf-8?B?cnI0TXV1cXJlWERVMHZZZk1adzkzZzVuWXR5Q0J0bTdyVkNkbndwL1Z3T01w?=
 =?utf-8?B?YzJBNTNnV1R5TWg2TUpyYkQwYWxIcWU1MVByY2p2cms0VEQwRzlJdE41N25p?=
 =?utf-8?B?MHBBMXVmTWFSN3lkOUxoRXNDY0tuZVFpSENBQWhyOVgySE9kNmJxa2ZGUE5E?=
 =?utf-8?B?a3ZOUnRlWEpkcnFwRXJUeEV5NVVtV05zemJPaXlJem4vWVpYK2hjMi9PUXVZ?=
 =?utf-8?B?djViNTBta2hmdDlJNllmQlNCbFREZ0psOTJwZkFPN2lMcHFqcHpzS0UyYm9Q?=
 =?utf-8?B?dzlqZzdvKzFYRGRBdjg0Unlqc3J6ODFiY29hekVHUlJqSnFIeGNLMXZIWnRJ?=
 =?utf-8?B?UWJML1hGVDhobThHeHA1OFpVcTU3YzFKVWNqUTRUVVV6Y0lxMVlDTkRzY3Za?=
 =?utf-8?B?L0tXb0xiaW9WYmp3aUlrVnNZRDVna2E2U3hyOE4rV0lOUVYzRmdCY2lmcjFX?=
 =?utf-8?B?OVBXWGEyOHdaS0oxM3hlOWk3aGlmSVgzbE5mMSsxRElXakRMeHJEVUY5b2dk?=
 =?utf-8?B?U2l1cmdHYkt5M0pQY1B1SHhZc3BWNjZFbnBCbGdTZklLZFRvNk93dTJKQjlV?=
 =?utf-8?B?VUtROU5LZWVKTnJWbUpFSEVzdWFpd2dwWDhRRzBKa0dYSlBiVlBxa0d2ZDcv?=
 =?utf-8?Q?kTyd8+5tR+4m+WOKf7kdqIahrW/Q9ow9Bki1MtXwbNZMs?=
X-MS-Exchange-AntiSpam-MessageData-1: urlkfR8hUH6UDw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec0184d-b60c-4a57-e8fa-08df0b555973
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 13:55:31.4335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nafkvEln/EIP1OPvqRGpCz+sru92xy0Er9YtEFbTowBuaEvQMj2tqf6cB8OE0VMulKAPTm5gRufq9unFwGUtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8750

On Thu Sep 3, 2026 at 12:15 PM JST, John Hubbard wrote:
<...>
> diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
> index d21dee1b89a0..f6ba883d72c5 100644
> --- a/drivers/gpu/nova-core/irq.rs
> +++ b/drivers/gpu/nova-core/irq.rs
> @@ -12,6 +12,23 @@
>  mod interrupt_tree;
>  mod regs;
> =20
> +use kernel::{
> +    device::Bound,
> +    irq,
> +    pci::{
> +        self,
> +        IrqType, //
> +    },
> +    prelude::*, //
> +};
> +
> +use crate::num;
> +
> +use interrupt_tree::{
> +    Subtree,
> +    SubtreeSet, //
> +};
> +
>  /// The message-signaled interrupt type a vector allocation obtained.
>  ///
>  /// nova-core allocates MSI-X or MSI and nothing else, so the level-trig=
gered INTx that
> @@ -24,3 +41,81 @@ pub(crate) enum MsiType {
>      /// One table entry per subtree.
>      MsiX,
>  }
> +
> +/// The PCI interrupt vector that delivers each serviced subtree.
> +///
> +/// MSI-X raises a separate table entry per subtree, so subtree `N` arri=
ves on entry `N`. MSI has a
> +/// single message that every subtree raises, so all of them arrive on t=
he one allocated entry.
> +pub(crate) struct SubtreeVectors<'a> {
> +    vectors: pci::IrqVectorRegistration<'a>,
> +    /// Every subtree nova-core services.
> +    serviced: SubtreeSet,
> +    /// The type [`alloc_vectors`] obtained, which fixes both the entry =
each subtree raises and the
> +    /// rearm write its handler owes.
> +    msi_type: MsiType,
> +}
> +
> +impl SubtreeVectors<'_> {
> +    /// Returns the interrupt type these vectors were allocated as.
> +    pub(crate) fn msi_type(&self) -> MsiType {
> +        self.msi_type
> +    }

This method is not needed. It is only used by sub-modules, which can
access the private `msi_type` directly.

> +
> +    /// Returns an [`irq::IrqRequest`] for the vector that delivers `sub=
tree`.
> +    ///
> +    /// MSI-X gives subtree `N` its own table entry `N`. MSI raises its =
one message from every
> +    /// subtree, and nova-core allocates a single entry for it.
> +    ///
> +    /// # Errors
> +    ///
> +    /// `EINVAL` if `subtree` is not one nova-core services.
> +    pub(crate) fn request_for(&self, subtree: Subtree) -> Result<irq::Ir=
qRequest<'_>> {

This method can be private.

> +        if !self.serviced.contains(subtree) {
> +            return Err(EINVAL);
> +        }
> +
> +        let entry =3D match self.msi_type {
> +            MsiType::MsiX =3D> num::u32_as_usize(subtree.index()),
> +            MsiType::Msi =3D> 0,
> +        };
> +
> +        self.vectors.index(entry).map(Into::into)
> +    }
> +}
> +
> +/// Allocates the interrupt vectors that the subtrees in `serviced` requ=
ire.
> +///
> +/// Every subtree nova-core enables at `TOP` must have an allocated vect=
or with a registered
> +/// handler, or the interrupts it raises are lost. Linux masks every MSI=
-X entry a driver did not
> +/// allocate, so the MSI-X request covers every entry up to the highest =
serviced subtree. A part
> +/// whose MSI-X table is smaller than that falls back to a single MSI, w=
hich serves the whole tree.
> +///
> +/// # Errors
> +///
> +/// `EINVAL` if `serviced` is empty. The error from the MSI request if n=
either type can be
> +/// allocated.
> +pub(crate) fn alloc_vectors(
> +    pdev: &pci::Device<Bound>,
> +    serviced: SubtreeSet,
> +) -> Result<SubtreeVectors<'_>> {
> +    if serviced.is_empty() {
> +        return Err(EINVAL);
> +    }
> +
> +    // One entry per subtree up to and including the highest serviced on=
e.
> +    let entries =3D serviced.span();
> +
> +    let (vectors, msi_type) =3D pdev
> +        .alloc_irq_vectors(entries, entries, IrqType::MsiX.into())
> +        .map(|vectors| (vectors, MsiType::MsiX))
> +        .or_else(|_| {
> +            pdev.alloc_irq_vectors(1, 1, IrqType::Msi.into())
> +                .map(|vectors| (vectors, MsiType::Msi))
> +        })?;
> +
> +    Ok(SubtreeVectors {
> +        vectors,
> +        serviced,
> +        msi_type,
> +    })
> +}
> diff --git a/drivers/gpu/nova-core/irq/hal.rs b/drivers/gpu/nova-core/irq=
/hal.rs
> index 1ea677e37e56..07604458dbbb 100644
> --- a/drivers/gpu/nova-core/irq/hal.rs
> +++ b/drivers/gpu/nova-core/irq/hal.rs
> @@ -25,7 +25,7 @@
>          Subtree,
>          SubtreeSet, //
>      },
> -    regs,
> +    regs::*,
>      MsiType, //
>  };
> =20
> @@ -63,7 +63,7 @@ pub(super) fn rearm(self, bar: Bar0<'_>, serviced: Subt=
reeSet, subtree: Subtree)
>          let subtrees =3D match self {
>              // The written value is ignored, so any write rearms deliver=
y.
>              Self::ConfigMirrorEoi =3D> {
> -                bar.write(regs::NV_XVE_CYA_2, 0u32.into());
> +                bar.write(NV_XVE_CYA_2, 0u32.into());
>                  return;
>              }
>              Self::TopEnableCycleServiced =3D> serviced,
> @@ -71,10 +71,10 @@ pub(super) fn rearm(self, bar: Bar0<'_>, serviced: Su=
btreeSet, subtree: Subtree)
>          };
> =20
>          bar.write_reg(
> -            regs::NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR::zeroed=
().with_subtrees(subtrees),
> +            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR::zeroed().wit=
h_subtrees(subtrees),
>          );
>          bar.write_reg(
> -            regs::NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET::zeroed()=
.with_subtrees(subtrees),
> +            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET::zeroed().with_=
subtrees(subtrees),

There's a bit of unneeded churn here. Let's settle on the import style
in patch 5.

>          );
>      }
>  }
> diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/no=
va-core/irq/interrupt_tree.rs
> index 5aa447cf0ec4..0b4dc2fc8ea8 100644
> --- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
> +++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
> @@ -1,18 +1,42 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> =20
> -//! Vector addressing in the GIN CPU interrupt tree.
> +//! The GIN CPU interrupt tree for one PCIe function.
>  //!
>  //! A vector's number fixes where it latches: leaf `vector / 32` at bit =
`vector % 32`, and that
>  //! leaf belongs to subtree `vector / 64`. The types here keep those thr=
ee views apart, so a leaf
>  //! index, a set of vectors within one leaf, and a `TOP` bit cannot stan=
d in for one another.
> +//!
> +//! Servicing a leaf has a required order: read its pending bits, then c=
lear them. Clearing a leaf
> +//! before reading it discards every vector latched in it, and nothing r=
eports the loss. Only
> +//! [`Tree::read_pending`] produces a [`LeafPending`], and only a [`Leaf=
Pending`] can clear, so the
> +//! wrong order does not compile.
> +//!
> +//! Serializing access to the tree is the caller's responsibility.
> =20
>  use kernel::{
> +    io::{
> +        register::Array,
> +        Io, //
> +    },
>      num::Bounded,
>      prelude::*, //
>  };
> =20
> -use crate::num;
> +use crate::{
> +    driver::Bar0,
> +    gpu::Chipset,
> +    num, //
> +};
> +
> +use super::{
> +    hal::{
> +        cpu_interrupt_hal,
> +        PciIrqRearmMethod, //
> +    },
> +    regs::*,
> +    MsiType, //
> +};
> =20
>  /// Number of bits a leaf index occupies, covering the `0..16` leaf regi=
ster arrays.
>  const LEAF_INDEX_BITS: u32 =3D 4;
> @@ -113,7 +137,7 @@ pub(super) const fn contains(self, other: Self) -> bo=
ol {
>  ///
>  /// Exactly one bit is set.
>  #[derive(Clone, Copy, Debug, Eq, PartialEq)]
> -pub(super) struct Subtree(u32);
> +pub(crate) struct Subtree(u32);
> =20
>  impl Subtree {
>      /// Returns this subtree's index within the tree.
> @@ -131,7 +155,7 @@ pub(super) const fn into_raw(self) -> u32 {
> =20
>  /// Set of subtrees, one bit per subtree, in the layout the `TOP` enable=
 registers take.
>  #[derive(Clone, Copy, Debug, Eq, PartialEq)]
> -pub(super) struct SubtreeSet(u32);
> +pub(crate) struct SubtreeSet(u32);
> =20
>  impl SubtreeSet {
>      /// Returns whether `subtree` belongs to this set.
> @@ -240,3 +264,262 @@ fn from(vector: GinVector) -> Self {
>          vector.0.extend()
>      }
>  }
> +
> +/// Clears the enables of the vectors set in `vectors` for `leaf` (`LEAF=
_EN_CLEAR`).
> +///
> +/// Shared by [`Tree::disable_leaf`] and by [`LeafEnableGuard`]'s [`Drop=
`], which has no tree to
> +/// reach through.
> +fn clear_leaf_enables(bar: Bar0<'_>, leaf: LeafIndex, vectors: LeafMask)=
 {
> +    bar.write(
> +        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_CLEAR::at(*leaf),
> +        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_CLEAR::zeroed().with_v=
ectors(vectors),
> +    );

Mmm, that's not the syntax I gave in my review of v2 [1].

You don't need to repeat the register name:

    bar.write(
        Array::at(*leaf),
        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_CLEAR::zeroed().with_vect=
ors(vectors),
    );

Please make sure all sites where this applies are fixed.

[1] https://lore.kernel.org/nova-gpu/DL3SD82Q6C81.3G32WDNS642Y3@nvidia.com/

> +}
> +
> +/// Clears the `TOP` enables of every subtree in `serviced` (`TOP_EN_CLE=
AR`).
> +fn clear_top_enables(bar: Bar0<'_>, serviced: SubtreeSet) {
> +    bar.write_reg(NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR::zeroed=
().with_subtrees(serviced));
> +}
> +
> +/// Clears the pending vectors set in `vectors` for `leaf` (write-1-to-c=
lear).
> +fn clear_leaf_pending(bar: Bar0<'_>, leaf: LeafIndex, vectors: LeafMask)=
 {
> +    if !vectors.is_empty() {
> +        bar.write(
> +            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF::at(*leaf),
> +            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF::zeroed().with_vector=
s(vectors),
> +        );
> +    }
> +}

This method is only ever used in `LeafPending::clear_vectors`, so let's
inline it there.

> +
> +/// Returns every leaf a tree of `leaves` leaves implements.
> +fn implemented_leaves(leaves: LeafCount) -> impl Iterator<Item =3D LeafI=
ndex> {
> +    (0..leaves.into_raw()).filter_map(LeafIndex::try_new)
> +}

This looks like it should be a method of `LeafCount`. In this case, I
guess the name can be simply `iter`.

<...>
> +    /// Clears every pending bit in every implemented leaf.
> +    ///
> +    /// Disables this tree's serviced subtrees at `TOP` for the walk and=
 leaves them disabled, so a
> +    /// caller that wants delivery enables them itself once it is ready =
to receive. The leaves
> +    /// cleared reach subtrees the driver does not service, and the `TOP=
_EN` write does not.
> +    ///
> +    /// Call `drain()` only during probe. It must not run concurrently w=
ith an interrupt handler.
> +    pub(super) fn drain(&self) {
> +        self.disable_top();
> +
> +        // `TOP` summarizes enabled leaf bits, so a vector that latched =
while it was disabled does
> +        // not appear there.
> +        for leaf in implemented_leaves(self.leaves) {
> +            let pending =3D self.read_pending(leaf);
> +            if !pending.vectors().is_empty() {

`clear` already does the same check (through the now-inlined
`clear_leaf_pending`), so it is redundant here.
