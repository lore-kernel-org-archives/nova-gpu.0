Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022104.outbound.protection.outlook.com [52.101.101.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B742B379EEF
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 18:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203338; cv=fail; b=mFj/t0BgdSnyFgY4aq4aE6g/CM2UduvIryc24nGEraIqTjjuzAGDVQ0BRZ5PR/Wh8Dc2ioSsT7uKmIr1NHddDT1JCVfAOLGrWqSZNSR4r/0EBIIDJQiUnzpM2BZmv/CJWIh4f40U52TCGk8Zu1ejB/HjEhRylN2ry2BUsb1pzPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203338; c=relaxed/simple;
	bh=YWGeP57C1daLBy4rkDOlyio8jWJbHfmXHjdwAkdkVxA=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=hI83QwFkl6KaUHpfhzuNqqHUn4SevENqyKwMrjRu2r7N+aYNqb06cjf+JmP/CUrNisRjp+p05Uqd6wtmHdN95ZqGqNDii1mDXGmTN1Q0FLqEs5NJyQXDHhsehNJJazk4lrVugxlpa09UvGPCg+vj76ShtAt/qIorIDOt04kSnUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=pr7eoRgz; arc=fail smtp.client-ip=52.101.101.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="pr7eoRgz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjRuTyGKHLywvg3E1klNdsPNbsm3a7KR5pp/IOVQcrOqKaSJN0I5qo6hgbn+E/NEgiZqtdXbvfIPfSplgho/RYvpv8UrDba8p4SX8mx1gIPCbRpRSlGoC7rDQP+q9A+X3EdPuf/PzHdfMdlkwho5NJMdFKuu4Fp3jezLaMDI1cHtwwB/6wL9xs96+8HU0DWOBNKZzOrqxBA/UaLDndHjASy99UKo8h2WFncg51uimwBra/GCNsOt29X2HeFYgtJ/I6S/bDYNypAleiH2AhtZ3kjLEx1gjY8Rx+IvDLey1ndIAo7JWbCKeb2pWeduOtiDQgRehE8czYhcphZ5Ape5aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8RxCvPwvuxhvtiQEV36amKlfwc53lLU8N+WzePDJQl4=;
 b=k8QaHLAAPYRQoUKQgD1Cqs2ZGwNTi+RXchgv7HB9z8HiYJ2ebvr598xaa77YDHTuORsFGecOP8P5Ib46Q9658mBW/EJo3QLQHdXvIcEuGSess+C+mfoIYKdDvsnWMg0Vww8xWrkl0z2RMa3uYW/+RTcHvfON3B1lusVgOIayEfSs+CDemiwBHEUuCN0//wAWQAqHWRsSWGQjDII0XrpOdPBk9Ta7TglE2EXrOZP9TLoTtPfYZWRkmJUPoV0iELAJIQWEaJLf2l9qYMmMc/tGSQ9NbhRt/VGJsJKqfPeu77HMQwae+jMIOGplGcTV1LlhlNbzLEvfNzdfaoNa5iWkeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RxCvPwvuxhvtiQEV36amKlfwc53lLU8N+WzePDJQl4=;
 b=pr7eoRgzQbdYpg1Zz9cn2VKJP3dLrXnRiMNc5qAuK/mjYmNBo7QxGT6BnXlQi5WoIcR/4JxrYATC0dcPXsESzcG9Vsz0pZg9uqLMg7CKFhYbB8UOiRW69jCuHNfODsKNtyD/wheumnu4mRygkoJZOPzHjXtPYJyVs+StHucJZS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by CWXP265MB2248.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:79::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Thu, 11 Jun
 2026 18:42:15 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 18:42:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 19:42:14 +0100
Message-Id: <DJ6FVVHX14V8.2PE4DOU69H0G3@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>
Subject: Re: [PATCH 2/8] gpu: nova-core: add request_tlv to load TLV images
X-Mailer: aerc 0.21.0
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-3-ttabi@nvidia.com>
 <DJ5PH7GLXQMC.3MB95TLS6T86D@kernel.org>
 <769e0e91a8715e3665545a22decd3eb8cb111ddb.camel@nvidia.com>
 <DJ6FCXEV1XRQ.1761U4FX665Q8@garyguo.net>
 <f55c43fc4cff816a0d10185d17f761051b879ac7.camel@nvidia.com>
In-Reply-To: <f55c43fc4cff816a0d10185d17f761051b879ac7.camel@nvidia.com>
X-ClientProxiedBy: LO4P123CA0264.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::17) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|CWXP265MB2248:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ede5af-9d03-4c02-e90e-08dec7e9283f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|366016|376014|56012099006|4143699003|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hPAjlN1rxyaXRC8HqObE0O6nr7fhHWtPjcFHaVpoo30cZDwwrmFtwNLBP30CbJlA41I6Hrc+0gb3gKHfecuwT+JjyExdoPV7ww61M3amfAoeJj58KqBX8O16KmMOKIoSrsrwEsdoV+ppGo+4Eat6jKAuGue+Zj/wZHkUA5tCVCWqTiKJdimKw5oHluaMk4q8MbuOhcxJP3eK7lwyDkfdXkGyatmPamGx+n+6RerWBvmklZbP9uu/5IBYbzNZ62nU+XftkUjEc5G9hJ+AWQNg4hZr0ZTRaPMluamBEofK73RG26orMiKtrh7oZRLOrePhCuzmJhg9oyux+diKOBEwaz3JERMWYiHznwmVFqig0CjYamgHgea0jLgJOS3cbMVVOTs7e/+fMRjilGciz6kFEXLzfdoJaTFlkzOhOxqh2Lbw5ECsFEMiGMb/MeRpjQePLXFhPMF4JcGa5KKAoacMn8DAgUZFSUbJ9mE6HJgREsVUwJZSi4hhoWRnQ4ZAiiZUApI4I/AMeVKSrsCG0jElxhr9FSSyqrMdD0uVc6RHO6WHBF2wMGgongVMSFQREbD2XhjJB4hLZZjtNtsmnkFGdaY6cw/MQsCksoVsM98mXko9ecb6YVpfoyXp4SmaUoUJBs+zJnJUZyj+AAhrKJKrLc3upZRwLgO+BCqAHb8AaH0QzkHNR2yGCzJ2mHFtSTmk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(366016)(376014)(56012099006)(4143699003)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2dGaGw0Z2lKYzk0eHkzT3dGN2RaYlZmSmdhOGxLamxQMWUwb09sSWtvaU1n?=
 =?utf-8?B?TTdXdGVqNzMrekR4VW5wUzVnaUVna204NEZnYnFiTXoraHRxYnY5b2ZLOGFs?=
 =?utf-8?B?K1llMzJBUVhzRWhPNjdyVFYwRzBHNkVlU0xISkJyQ1pvamtNa1MrOFo2QmxC?=
 =?utf-8?B?Z3ZURkErMlFaQ3lDQmkycDNlSGRGMDlTUHh0dTlSWlpZeDRwN05ySk45eExH?=
 =?utf-8?B?RTc5TFVXaWw5OFFoS2E1a1Bia1doakd0aDRaQnJvQ3Q3SHVGRDlQM1dXOUFp?=
 =?utf-8?B?RURQdXkwWmgwcFRQcGZEc1hiZG1vZEp3aFBoVEJVK0luS0xwNm95VWEvWURi?=
 =?utf-8?B?MEtBaWNMbE9KczVTNzBjSHBsU2NBc2pJdmdsTnM2LzlRVlpIRGtyMHRBc29z?=
 =?utf-8?B?T0R3NnhpNmJJbjlGdXJMYyt2V0R5QmxUWmRDelpJTk1rZXI5dFpKSTdQY1M0?=
 =?utf-8?B?dEkyT2kwaldkTWJPVTcwTW1FYVlHVnJnT3I1eGY1QzBSbVV5dWdzT1JrLzRv?=
 =?utf-8?B?U1I3UmcwN3dnV2VsVjVBYUJJS2t5Q0RGb1I2OG1tTzh3ckdDTjJwVnh4QU51?=
 =?utf-8?B?dUNjbVJnSndxaXBHSkM1SnZiclAwbGhlZGtiaDQvNGZPMFVadWJMTHBQMjZQ?=
 =?utf-8?B?S1BtTFkvQ1Ewd3djMTBXaCt4bWFGWDVuSjFIV3FycGQweVF4dHhUd29wSVdF?=
 =?utf-8?B?cHJ1RDdXTldESlhMYUNOajlFV3d4S0tsSlRYLzJxNm84a2JreCsvMDNiS3FF?=
 =?utf-8?B?TGRlVGJ1azRXbHNxZHhjY1FxWWxrcDY5bUM1SU12V3hzMHY5aVU4VStSSTRR?=
 =?utf-8?B?UDV3RERWV01Odm8rcm82WDg1TjVOS0FhaVBZSDJ3UHp2ZUpKbEpyTmJkZTZY?=
 =?utf-8?B?V1BIdU9yaHlWVXZtOFhKVm5oSkE4VmFGZnc3YlVMK29KdjBBV1haMDY1NW9x?=
 =?utf-8?B?VmFTbk5VRHZUeFNPYVBuMmVyTjlZUjFzZDlyZDZzRXNoWjVyc1F4VlV4YlpY?=
 =?utf-8?B?cGlNeVVEUktGQkk1aUJXckJmcHNDMld0N0owS3E5dTNLQm55Nnl4bEVXY3hC?=
 =?utf-8?B?R0NPWXJJRTFHVnRhRkNVbEZ4R0tnZ1pmVmRrVHA1NkRWQUJQOUI0ZzBsemJ1?=
 =?utf-8?B?cWhKNVlTUlhKaXNleWI2VWlldFBaS2duZGl2RjdyUUFUcFVNM3ZrYVBreDhM?=
 =?utf-8?B?T0kzaCtDWEw0eXFBTTBCcVk0NVVLcCtGTUoxbkpCcHF6VmIyVk9NbDNPVEJJ?=
 =?utf-8?B?NVJweDZWSGJrMzdsRldpT2dpTXdyTzJBTzBLUjZPemJMNzRGVTdVNGRLeHY1?=
 =?utf-8?B?VWRPcjQwZE1iWDFTQ3hlYVZ0c0Zjd2FZM1NjU1k1NCtnWmJ6KzVkNFVHZ0Zv?=
 =?utf-8?B?WG94bTVwMWFqSEpRakxob3Bac21wVnIrejAydlNOMWJ4L0lxVHcxc0ZndE5Y?=
 =?utf-8?B?a1VMaThNYWRockVpbXUwdXlKV0ZrSzFVeEZjSW5TMWFvUmVPN2NscU84TSsz?=
 =?utf-8?B?U3RkTnU3b0duSmRSM2tQREZOaG1XU0xKd3o5RDZZaFFkanBFVzNGbWl4RFc5?=
 =?utf-8?B?MzQwcGtzaXE4Z0pWUU4xL01uMzhjUG0veGNEYWJ3c2FKZnQveUNYOCtoeFY5?=
 =?utf-8?B?Z0w4Y3dZWno0QTZuRVBCU3VMYUFySTRMMXpBV2ExcGt5YlhwR1d6RUtndE1h?=
 =?utf-8?B?bHVHc1RTQVdYVEtKUW05Y3lvaVlMZWJVV2lEYkxzUnBxTUFWL2U5Q291MFRL?=
 =?utf-8?B?TUd3V1ZKancxeGdDQ3FrVS9aa01kQkZid1VhbGFVdW5DWFF1STVNWTU4OHJm?=
 =?utf-8?B?dDM0SWN3My9jV0ZFVXhpZFpqWWwySWF6enhIVm1ZaVVPMUVja2VBV0x1WHhQ?=
 =?utf-8?B?WGdXY3JTeUlMcGFydHB0U1lKaEp5WFFVNmkzYnlRb0tqdzVlMlV1c2t4T1ZR?=
 =?utf-8?B?bG9HZDhreERRNmE4bFB4dE5wZnRKYlpCRGJtVFZQUmxmMG1GZW0wcytmMU93?=
 =?utf-8?B?ZXFJU2orTTNvQWIrUlRFTVp6dWhZSDE1VmNvT251WENkbU9RUUMrd0JHQnZN?=
 =?utf-8?B?MVJKSXZ1NVMzTCttbTVTT1VsRno5NmQ2YlE1K3IyWHl3VVp6MkpObkhBay9T?=
 =?utf-8?B?akZ3TENXejhjL3o1UEg3SnZQVWRtTnN6WkNxc3N4a1Z1amtQbXhwbHoxZ1Uv?=
 =?utf-8?B?UkVmaDRIb1BNcWV1bk9tdnY4UVZvY2FjSkI4M2VweTNLUmhLZEJtdGt5cEdi?=
 =?utf-8?B?S1RVUUR1cVZnODQ3ZFo0SnBkdEVkVEs1WkUrNS81R3Byb2RGVEFXalpSZk5M?=
 =?utf-8?B?NC9kSGhQKzQ2R1BiWW1rS0lxbkN2WU1MWUdreVJiT3FOOTZ2T1VSdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ede5af-9d03-4c02-e90e-08dec7e9283f
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 18:42:15.0703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxBykPncEXZ8DxRn1/eipIfEnvPSnWHQ2+7F4Ul2mztAG/t70R1f2JwcUVNr7Q1LuM6Y+QD6JYS7w+D3r0PK5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2248

On Thu Jun 11, 2026 at 7:26 PM BST, Timur Tabi wrote:
> On Thu, 2026-06-11 at 19:17 +0100, Gary Guo wrote:
>> The goal is to be able to easily find unused code. If `expect` is used, =
then
>> you know for sure the code is unused. If nothing is used then you know f=
or sure
>> the code is used. If `allow` is used you don't know either way.
>>=20
>> `#[allow(unused)]` should only be used when it's used but gated behind s=
ome cfg
>> only.
>
> This doesn't make any sense to me.  Why would I keep code around if I exp=
ect it to be unused?=20
> May as well just delete the code.

Which is why `#[allow(unused)]` is discouraged, because it allows people to=
 keep
code around without deleting it.

>
> Are are you saying that in patch #1, I add expect(unused), and then in pa=
tch #2 I remove the
> expect(unused) when I actually use it?  Because that seems dumb to me.

Yes, this is what is expected. No, it's not dumb, because the fact a "unuse=
d,
but expected to be used" function being actually used is a useful informati=
on.

>
> To me, the whole point behind allow(unused) is so that I don't need to re=
move it right away when
> the last user is deleted.  Or conversely, (which is what I'm doing in thi=
s case), allow me to
> add the function without any callers in one patch, and then add the calle=
rs in a subsequent
> patch.  Then, after all the callers have been added, I can remove the all=
ow(unused) cleanly.

What prevent you from forgetting to remove the `allow(unused)`?

>
> This gives you a clean sequence of patches, without having to deal with p=
ointless "unusued"
> warnings that would happen if you only applied a subset of the patches.

Same for `#[expect]`

Best,
Gary
