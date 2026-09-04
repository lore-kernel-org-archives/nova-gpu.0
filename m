Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011056.outbound.protection.outlook.com [52.101.57.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59933101B6
	for <nova-gpu@lists.linux.dev>; Fri,  4 Sep 2026 13:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528764; cv=fail; b=TPVfpVIlQvLNNFPFZVB/L3K3bs9VoVSKCBUVm3ANWhPBKbUH58Ij0eR+Beh+w53dK8B4jJbTEW0JL5Dk+9hV7huaEecdAkEuK2bv8TxdGMYaA7M2c4HWum+4XSByvzoKWMZ/YzbyG+VaQsQPrRZqua2qU9CVrZCrIGEM04jJH0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528764; c=relaxed/simple;
	bh=d6b317xfg22LzvlNyWElAWEvY45GyGrC/YGQEPxNuEI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=LXOXL41ORLUdrSUn7BGVFX/hTSeTZbSBfaEQO7HQsxPFg7s3kpJaOqMIouRNhpSev+h+/WJ0zpqcvtxJ7893Xjtt5HZhZT9kYO+5Kh+y3VS7vp7hnF7PbjBhxpxMhdajrvX0jcbWNA20gPipEWYVwMR0i2A7Rfa6QnWA0eG9OpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GIplvk7I; arc=fail smtp.client-ip=52.101.57.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GIplvk7I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kria2Y+6VhUJkg1qKPTZoLeBs3ec7fvIm6FUZk3IOHDayTAy2AOB8lyawMU9Wr+q1Cs1EZbLVR8pOz4lSNS2dTt9ThaAJ4gt57A2LdeZhJpy5zL0UjTIFfHpjLhUjEjAfvyH7/8kX9WWdvD2fY2vK8DvOjQMsuLtLsGNE7Uc8HF+2kb22VGxMZscTmyqrZxn/V8CSb6AjGmZAxS1UpJOhQp/IQE2u5+EIvN0pyt9ga80PvOEgayIM0gHNn8Z2mmHzw96gBsrMEmLyW+4vjpZZr5JatR6OKMT9uyxAqVmbFmA/naP8l8Ba/P+n3yJtIyws2rKgzsx9UBrjxgBAdFpSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neklWKn8ZIyItsPSs6DxpKW88EiWOzSi8gJG9EoubqE=;
 b=sRBoqLe7izJEgMPWGp0nEFk4nsXwv6VARFoSVybkd+Ncnelqk7Ft9WR76224PgDTW0OoA3CRoA3VYdeya3Xx+7hvcay95YSDsOuqcEv3JqUSuzNF1n0JunDVDrnhQsNJ+rZm+vvXHldR89uCx1jZQBwk2olvDtUxjWFFlmHg0Z3ylhT7ZJ0mbF5nT8oaZ1CeMiwrpJEoG4S5Q6x3nIA81kM++pGunQIVUDDFG10UK67TJa83noRM/1aihSz61G5roXEHOolQ/FhB3R8Ja5PStrMunQxAu9ikaOSAGlIgYXW4rGZ79x1nB/2CB71s3lJBKj341/cMatN5sxDBiTLbhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neklWKn8ZIyItsPSs6DxpKW88EiWOzSi8gJG9EoubqE=;
 b=GIplvk7IVoRonLl3dpsZn4T/Aj0YezcQ2UW09YxS07tIXCe0Gyk4w6wYaqS6P7VLPtyTlmEbphkehTNJCXMA+wg9OfddeWq69ZOmIvKB0833//9sDHGsEXvANwTOX9qloIP2JV7RIsI/I4N1AbOcKdza5BMIxs/aqyLVLreV2+qHnYj8DKLsh4L6pfIEe/TPRzBQxZYs3ESToq3/PRZJNwGMV/qX09ZbRky9mjljf1EzLxvgGrMxwpI6pKdwbRn0zfv7mQNeRPb6DPqO/IG4lrIJ7VdJQ4mT0HNqijzagNHrDGGka6EAoNpbDHfm/Sp5BwwJifXdemYyGtkSHdNztg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DM4PR12MB5939.namprd12.prod.outlook.com (2603:10b6:8:6a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 13:32:34 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 13:32:33 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 22:32:29 +0900
Message-Id: <DL6KJ0KDZZSA.2N71SIYKCHIGI@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 10/14] gpu: nova-core: bound a GSP wait by a single
 deadline
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Content-Transfer-Encoding: quoted-printable
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-11-jhubbard@nvidia.com>
 <DL6HKLWO40GT.33FO5AXO9MDA3@nvidia.com>
 <DL6HUQVA7IDA.26SA4DKY73GPG@garyguo.net>
In-Reply-To: <DL6HUQVA7IDA.26SA4DKY73GPG@garyguo.net>
X-ClientProxiedBy: TYCP301CA0055.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::6) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DM4PR12MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: ea47b21d-5221-4b08-29ca-08df0a88f945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|10070799003|366016|18002099003|22082099003|5023799004|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	DAy8Hjr4vkvSdVI8eJLdOifuq0I+GL8bTqus816fdm6lS10L9XgJmVv+MYQgpoOi+FOBR9hWbHc5Io4fN4OAo9sObnkGFOVDDVpT8BsaLEmAKFBo+T+1GZqNgWSzIs4NLox/pWAK+e3363Wkfu5PBkvaKVHsvrDGbtmZYDWTzoJdjeXfp0pQGOQWp0qqWLTC1x8VYyxaVkoacy7KvhxJji0/yV//Zijbhi8vCAkmoW+BjbtcDmHyYIIKHcSWMyyetHIc9ajlpi90sjJD2aYUzzDK1VUcne2U11dW8XwL9mqQ6J1Fptzml5xoWo3OTp8DyyqURVDRi4y54on83XUcjbj8Vs8ird4+RfJ7dd98kbWnX+WdGhtVRkFE6bN7xjbVd+rTTmu4jqpPWROCEamRY+/OboyRJWvtyDo2apOuHH8cEuxTDjqVobm9VapTJCLEI+JyvtAcRYzWMykzVcOIfoU2aPJ09pw31JUHopMWTTl09EEQk+VNrSo3hW3oKs8uhsY8PK3esWHlWFquau+xOZZSI71+29m4gy1UN8bzgG7UbfIeRgCl9YGL9BrjNRuJZBpuOtYliOYnn07Zbp5ynAC7vFLM5OxugDSc9wsDFRAliwSlJjlLcv/M8As8fReKMI+XSgPRVNKDtYPXnofoK9jLdfYtmygTws81LufIwA4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(10070799003)(366016)(18002099003)(22082099003)(5023799004)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WThXS1BaOVJ5K2VvbVhiaXRreVJOZnpCQ2FRVU41MXh2d3RYWG5KMkI4dUtL?=
 =?utf-8?B?OE15MTd0SUN5MVBxWkNxSXNCYy9qVWQ5OVB0ZnU5ZnpQZlN4VTlJZk5SYy9H?=
 =?utf-8?B?Vmc0VlI3dWxpSUlxSkc2VHcyYlpiNkdyVGZ4bGs4UmpITk9YTE5ueUtpVjRK?=
 =?utf-8?B?U0traXJGa29PMXo1OGQrM1IrSFE0VXpRL2RzOEoyVUJ6QlVESmdKUjFzOE04?=
 =?utf-8?B?WXZqdkNZOHY5VlZIYVZFWjYrQ09WWjRIbHBUWVRNQmRoY1UrL0QzNUFiOVdR?=
 =?utf-8?B?TUhPcFdZeEpuRWhVdDg0WjI1cDVNeG43WnJpQlVPNmdoMERwYlJaTTd5ZEtB?=
 =?utf-8?B?eVhLdmxDNHRBZ0NCa0wyQlF1TlFqNDNIMTFJTnE5ekoyTll1YUZ5dzhrL1V6?=
 =?utf-8?B?eXJRUTdIVlJIUWNpeGxvelE4M2FIcWREVHc1dEl6S1MwMEFJQjE0NS9ZaXJD?=
 =?utf-8?B?R1dLR1pFbzNqNWpuQVJ4T1RNSS9WMnJ3aGMzSThwQVlFNzg3MGNBdThtTXV5?=
 =?utf-8?B?Q1ZIQ1RiZjUreDlHZFkzTTZGeE9CRVoyMGFaYXlJMVpQd1FQUk5zYWJGOUVK?=
 =?utf-8?B?WFBaanEvSGR6NXFuVmFUVVN4S3dVUHB6aDdsTVJMbFl2WngzR0t2UjNoUXNI?=
 =?utf-8?B?K0Frc3hpbmxuMnhiYnNoRFZ5YWVISlZMNWhPdkpNNStYOERaU1lpR3RocXJE?=
 =?utf-8?B?S3k0QlEvcmFEWGRzTzdCOWxUOHlKcmZCeXlCbllpc2JMODcvcHhScXl5WDVG?=
 =?utf-8?B?bk1sQlJPV2ZscURtQUdlWHA0YU1LcnYxSUFLclk0QlJKY2lmc05Ec2prdmht?=
 =?utf-8?B?RmhhRUhtZDRHS2F0Ylh1UThUVkVvV1Y4UnN0L2V5clN6T0pVZ3NDSmZUWVg1?=
 =?utf-8?B?WC8vZDIvN2VjNThXL2J0NDdjMWs2TkFvSytBUFFIKzdrcm1iblhubDV5THpB?=
 =?utf-8?B?V09PZnhGZFJrb0ZsNEFPQ29ZUHZBY3A1MFJmdUxyQ203SHNmQzhjclBtZVNr?=
 =?utf-8?B?d0FzOEE5eDlnRjBnT1I3U0VleWhadlFObTdoUGMrbDBteXFzeEI4UFRkNGZx?=
 =?utf-8?B?TGhxUkFqbmdReTlaWTVPTHdqUlA5OENNUXUzNjAwMXl0ektrLy94V0lmcWRk?=
 =?utf-8?B?aTlsUmNDb3F1cUpvQnBzZHNjUkxBeG1OTWhNY2MwRy9TM0JlRW4ydCtTT0R3?=
 =?utf-8?B?anpXTkp2V0RtdWZsRURueWZsL2xBN212SFVIQVNsWUhVUGxHS0IwN1RmUWFW?=
 =?utf-8?B?ZXZ3czBMTUhxaktvT2c0VndRd3FvdWtDY1QyNnhVVUFzMXd4TmgzUDlPSlln?=
 =?utf-8?B?OFNHQlorVFE5bTJ4L010c1FzNHVDd0FhaG9RRU9MbER1UkRIalQwSDlwNGx0?=
 =?utf-8?B?MGg0RmEwL2RRK042MDVBWVJiT1E5UVVEU01oWkhwcDdZVHpPMVlIY2RESEVJ?=
 =?utf-8?B?dW9TeG1BQ1Nuams2SWY4T25Hd0p6ZWlhb1lMUGl3Vzh1TEVUd09UbG1vZEYx?=
 =?utf-8?B?UkpydHNiL2RuS2Z0QUVvMWdXa0dhOWFOcW90eGhRUzF6eEVuMVpjdmlrWkNv?=
 =?utf-8?B?dHhWTHVvVjgyZkExZmY4T3BXdy9WandTd0Y4RzFuaDhGaXRzTkRjZGZnV243?=
 =?utf-8?B?V1lUaEl2TDNhRWRBWW83SVBBeHZwKzA2dXB1c25zZFd0OTI0b2NsdWdOUEZI?=
 =?utf-8?B?a2JxVzk5amJVNWljdXp6ZGR3c2c5QXVLOHhQeG5LeWpXeWFlQmFmejhuL2JR?=
 =?utf-8?B?VlUxYXpKclh1bzRxYWRNTXE1bTZlQlN2K01udFRDQ3ZiYXp6L0xmcHdkdHVJ?=
 =?utf-8?B?ZlZ1Zkl6TWNuck9qMGsvUFhJd3krT0pxeGZ3TkU3Y3lFM3ptQ0NNeUxjUXFy?=
 =?utf-8?B?QlRIQXk0eTlQbS9ScTZoMHEvN2RVSjREd3hQanQ1ZUpOY205NkU1OGVYNllF?=
 =?utf-8?B?bVcxc25yUy9UUy9wWnFSRndDTmg0ekEycWEwb29PS2VySjBsUlNBdjBhSVhB?=
 =?utf-8?B?Y1phbXJvY3RFS2dXMGQ0TU9wM2RWd0FOK3p6TGNEcllERkNNSTcwaWtrNTls?=
 =?utf-8?B?RklwanJVUmRUS2xIOE1NV3FSNnhXcHNtYXpMUWc2VWxIZE9oVXYwNjFBanBC?=
 =?utf-8?B?Mkp3TGhKaTNjU2ZMSWtmNmNYTUgwOG8rVEdoYVJoS0RuMThJbDQ0b250c0cy?=
 =?utf-8?B?S3VVL29ZcDdJVThrMjhsbko3MlE1bU92ZDNpaHlVRUEraEg3QWtGNndMdWVt?=
 =?utf-8?B?ckNrNXdYT2RqcVc1TkJBemtLTXBvSG5WbTFnWmMwUGZlZGw2bzRsMmZNeUhq?=
 =?utf-8?B?V3U2WldXTDQxaWllc2tBd2hoZU4rVkdLa3Q4djJGZnlHZGZuSVZCN0orcGZQ?=
 =?utf-8?Q?n0KV6Tx5VM6EKTz9sBodqhL8aJyCQKsCYL+1qSqXM449a?=
X-MS-Exchange-AntiSpam-MessageData-1: DVG8zANTr9ubPg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea47b21d-5221-4b08-29ca-08df0a88f945
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 13:32:32.6630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vbi8co9+nkQ+coe3rHQO+tT49BXKaNu+9LP6hNTT84ylbOZTEKaFskoHaz2fEQBKpr55HRh3OFYOYB/Bu6h4sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5939

On Fri Sep 4, 2026 at 8:26 PM JST, Gary Guo wrote:
> On Fri Sep 4, 2026 at 12:13 PM BST, Alexandre Courbot wrote:
>> On Thu Sep 3, 2026 at 12:15 PM JST, John Hubbard wrote:
>> <...>
>>> @@ -611,15 +621,39 @@ pub(crate) fn send_command_no_wait<M>(&self, bar:=
 Bar0<'_>, command: M) -> Resul
>>>          self.inner.lock().send_command(bar, command)
>>>      }
>>> =20
>>> -    /// Receive a message from the GSP.
>>> +    /// Waits for an unsolicited GSP event of type `M`, logging any ot=
her event that arrives
>>> +    /// first.
>>> +    ///
>>> +    /// The queue is locked for the whole wait, for up to [`Self::RECE=
IVE_TIMEOUT`], so a
>>> +    /// concurrent command cannot consume the awaited event.
>>>      ///
>>> -    /// See [`CmdqInner::receive_msg`] for details.
>>> -    pub(crate) fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta=
) -> Result<M>
>>> +    /// # Errors
>>> +    ///
>>> +    /// - `ETIMEDOUT` if the event does not arrive within [`Self::RECE=
IVE_TIMEOUT`] of the call,
>>> +    ///   however many other events arrive while waiting.
>>> +    /// - `EIO` if the queue is poisoned or a message fails framing or=
 checksum validation (see
>>> +    ///   [`CmdqInner::wait_for_msg`]).
>>
>> Let's not mention private methods in public documentation.
>>
>>> +    ///
>>> +    /// Error codes returned by [`MessageFromGsp::read`] are propagate=
d as-is.
>>> +    pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
>>>      where
>>>          // This allows all error types, including `Infallible`, to be =
used for `M::InitError`.
>>>          Error: From<M::InitError>,
>>>      {
>>> -        self.inner.lock().receive_msg(timeout)
>>> +        let mut inner =3D self.inner.lock();
>>> +
>>> +        let deadline =3D Instant::<Monotonic>::now() + Self::RECEIVE_T=
IMEOUT;
>>> +        loop {
>>> +            let remaining =3D deadline - Instant::<Monotonic>::now();
>>> +            if remaining.is_negative() {
>>> +                break Err(ETIMEDOUT);
>>> +            }
>>> +            match inner.receive_msg::<M>(remaining) {
>>> +                Ok(msg) =3D> break Ok(msg),
>>> +                Err(ERANGE) =3D> continue,
>>> +                Err(e) =3D> break Err(e),
>>> +            }
>>> +        }
>>
>> This block and the one from `send_command` are strictly identical - we
>> should factor them out.
>>
>> The right place for this seems to be a new method in `CmdqInner`:
>>
>>     fn await_msg<M: MessageFromGsp>(&mut self) -> Result<M> ...
>>
>> Then this `await_msg` simply becomes:
>>
>>     self.inner.lock().await_msg()
>>
>> While `send_command` is simplified to:
>>
>>     let mut inner =3D self.inner.lock();
>>     inner.send_command(bar, command)?;
>>     inner.await_msg()
>
> Unless I misunderstand the GSP code, the unmatched message is not discard=
ed, but
> rather the caller returns from inner code, and drops the lock so other wa=
iters
> of GSP message can have a chance to take the inner lock and receive the m=
essage
> so then get the non-matched message out of the way. So your suggestion wo=
uld
> cause `await_msg` to never complete in such cases?
>
> If my understanding of this is correct, then this code should just be mov=
ed to
> the outer `receive_msg`, because all callers of it have the same loop and=
 I
> think it's a wanted behaviour anyway.

I don't really understand what you mean here. There is no concept of
other waiters at the moment, and `receive_msg` unconditionally advances
the read pointer. In effect, the queue is working in a synchronous
manner (which is the design of the queue itself, not a Nova limitation)
so there can be only one expected reply after a message has been
successfully sent.

I think once we move to the newer firmware we will want to add more
sophisticated message dispatchers, but for now this simple
implementation does what we need.

As for my comment, please check with the code - it's really about
factoring out a block of code without any runtime side-effect.

>
> BTW, ERANGE is a very bad error code to mean "the message had a recognize=
d but
> non-matching function code".

Maybe we can change this to `ENOMSG`. This will need to be its own patch
though.
