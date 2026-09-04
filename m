Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010018.outbound.protection.outlook.com [52.101.201.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D914A0145
	for <nova-gpu@lists.linux.dev>; Fri,  4 Sep 2026 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529562; cv=fail; b=dY6T8gk6EGq158kX4xJ0XaKhCCWWWTnSQjDprAHH640IhRkzicKm+IZcgge8Zucg1agaCwsyYijIkpUDTdmosNV+C01bxRd5xjKwLzDshQxQuzu3D8KD7gHzH3W7M9B7s1JduN7NNyDSa+mgxQIFpWmNbeVZRACtQ1mbcUBU300=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529562; c=relaxed/simple;
	bh=UBsz0hE7DEWBK+EAevhoYISW6RYXpfZUwK2AZBxYPNk=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=i544+CElgWiCDy7eE6lxp8GvgbiTrA9L3I1B6slmGS08RDjgj7uc01HhoV3HNX0xL82nDHzypjcZRGw2h8DR3e2FgFThnYlykjgs1KRWwAcl/7pMY8O6f8BGEcxCevY2Jmp/QEodSsffVaphPKZukPu7d3g5KurUsPlLmYHJcFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EY6cw+Wy; arc=fail smtp.client-ip=52.101.201.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EY6cw+Wy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6rN4fMiYHflyHK1phpgiaJcVYhljudFqq3+53LAE+i66016zxQSv7e+I/GU3qryBidfpQlzRoUelQLyZB3P7TwP5+tzqX7Yi67jIJcFz4B1AsjuUuTDPJz/488Uev/ah/kFvWMjw/Okff3hpW/v10qYXlVViD0sXjxnzgcMPFdlGMMHBW0W5m2hsxiZV3Qomj+8bKSwPHifp24sQSStBXMDWz+Wp0uxDzwzLF7psym1FImNCYxqe99z19QCdhzus1TOeyisgYn0D2kQ+nqBZt6nrLSONbdN6qAItXnyxxXWwhU3Dp3zwvM1NAAJJJ/F0pZVToneKzfWZgOrzsRiZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoXXoCcEJH1OVqXmAA+mWcDb1RFyRkgwQCA0LrBXxcA=;
 b=CzwSvO+f/T70zcNh0aSC1wSAXl1yvHG6znWU+8uAuBN0oMRDxP4dDVqurkyVd2g1TeXNSlw5zfPKQ3WZiwhYl5EHdb9mEBQfZcWh/6bavPiIqrShgUz6wf0FywjMU/dlq95IVgNTNxUA9/3f2mrxEl65j05/owguEm67tdi7ADvmD8sSAxxniY50rUU0vzivmx7ypbfbDhYQoR8c+iqZQHPk/HOxzgIqMgx3h9Aw/ZgKVfsNB1olouzuQqvNXED+NzztEp+k9+RwY5601CesnaMSq73cWDn0Ck4/ZgYCJR5qSBZ8r5WfEVOqIl76ZBdCzqoV9sPGM/HGBc3ijyrJ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoXXoCcEJH1OVqXmAA+mWcDb1RFyRkgwQCA0LrBXxcA=;
 b=EY6cw+WyEaLRNBEtbpywFOW78nwre7wClqLzZupjfOKBBEGOPiGRR72RB1NyCSb5vKkJnuto8SEPWEyBDAO2yIOlT0kEDPyNZ3RgOEwoUrkGQkMD0X7cxUBhTu6XL/EAnj90QA89WWgknG4vM6Uopa3c7zgCQ2IfW5N7Ngo8Ko8RDI10uC1g9LcPqPxridRWa4FCbzG7g40H8/AlC41NV7C9mJsSOHYZVm3zPkwh+AtoLN5mv+LLpLTecV4DrRTtCE7s7qVzVydhsiO2bqM2vWflmlzYTvE8MiI8xIXeL/HgwFgmV+cdGiD7bWYVObM5tNIOPNQAHHFv1jEOVRRKgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH7PR12MB7257.namprd12.prod.outlook.com (2603:10b6:510:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 13:45:53 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 13:45:52 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 22:45:49 +0900
Message-Id: <DL6KT855MS5M.DJ394FNCITCP@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
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
Subject: Re: [PATCH v3 09/14] gpu: nova-core: recover the GSP receive path
 from corrupt framing
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-10-jhubbard@nvidia.com>
 <DL6H5DZZH2LO.2G3VISAA35F0T@nvidia.com>
 <DL6HNIUL8F4C.2BK4H023OWBVK@garyguo.net>
In-Reply-To: <DL6HNIUL8F4C.2BK4H023OWBVK@garyguo.net>
X-ClientProxiedBy: TYCP286CA0105.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::15) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH7PR12MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b9b5308-3608-43bd-f72e-08df0a8ad5f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|10070799003|366016|376014|22082099003|18002099003|56012099006|11063799006|10067099003|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	GWVZUPa+fj89hcezJDv/QB2N6InDblMGb4wcthedyQFeUef/IagKYCnW44WenyF2TEjFC8B+Hqs0z3FWdcEmW8xuYrSon2ucUytecfaeS2PNZyyub0cliDtWnhL1Vd0T1etjxikDdMCUGpJCsKeKXRJvh9KeEHTHEXa+bTfGUW8Jkau/spujA9HfouFbsGw4XOPTkCxhz11rRbERPo11VvVseMdymqzucaOHHd3pA8xfDvk0g60bEgdZMvmv5Y35QWkmE/ORt9c34S6S2n3k4I0mqy1pveH5Ym5BqSind376dEljvva41H2hfxdbS47ai3wAwI/S9m7Em+265/U6CUgYAa8j5N57BBBPI4V/3sGzFmcdBJ/XjZ3xzuZAUhsNAC7+aTGYga5YITRAyRc5LDsErqK/wUXxOT+NsTOuUH+N+7p06hj/zwLPj9NxhSk619JK+qq1DUn6YajQrMLHv71Q8SbRkLlyR+exC2MtziMLCdgalrbCTMv7tmKw4pdJo2jF4zaiR5NGkgMw9RsbbqoTZcq1xWzD/0TF3hvRpnkSwFoZBBHEAbFh1VQ6X+iDMiFZI2djoMvVoUoPCdzA2+5lVrwry76YEsig7VmcTD1IcJCmEUFOvsTs1frz+ompDvvKAtCf5OAn/SSDc9G7LnkJHNJ4sA0UkWgreuznRL4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(10070799003)(366016)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y21QcmdOajhyZWE5YjFXOUpyR1BadTZZL0k5SzNMNE43bEc3UXVqelNuMW1G?=
 =?utf-8?B?SXpQZC9ZZnQzcnVKRnRtZldzbFpNWHNjYVVQbGF2YnQvYitSaks3bytzdnJF?=
 =?utf-8?B?eHdSaVU4cWhTVGdONzZwcnc5OWRwT3drOUNlZmxPUnNFZlpxeDh1aFRLd2pE?=
 =?utf-8?B?QTN3cVh2bGdRUWFrQVloM0NSRVFPaDZVeEZlWTIxOUVqdTlqZTVCNEhCeWVQ?=
 =?utf-8?B?eGhhRXJqUUliQTJ2ejZZb0FvZkhuTGdDU2RDWlVqZkp2WFBmQTNwb3ExT1VY?=
 =?utf-8?B?UEZ3L2VmNWtOSnhyS1hqa2JQb1RaaGpNOTl4UTlBL3R6Y0ZDVUhmeHg4bmM5?=
 =?utf-8?B?eGRIWmxRRU5rNmxJMmVkNzUrVGNQKzlKOHdEbFcycllOQk13ZnZUM1doNUhm?=
 =?utf-8?B?UTNLcUNoRFR0ZzNVZFIxd0ZuaWJxamJ0dm5CeU1sMWcvSkprR3pGK3VUUS9U?=
 =?utf-8?B?L1lERS9VTTZXd0Jzck83eEdXbXJiRW9hWDFmNWdKd0phYnNIQ3poazBYTXFX?=
 =?utf-8?B?TXcxRjd2NjhSb0dqQ3hKYk9kQXZ2bHFuOEltNUtvNkx0dmhMYXMrRDdkS0xy?=
 =?utf-8?B?N056QU41MXFmQS9VdXpYYzF1dk5tMUttMjNUTkhSSksrblJJdHVaQWdHbXcx?=
 =?utf-8?B?RkxrSHRKSHB5dnIwRzdRa21NM2pCMEhqZm1WUDQ2QU8zZHJQbUc1UEN1NTc1?=
 =?utf-8?B?YmtTZ0NvaG04TEZUdjVYeG4zc2JzWHZoWm5zWFFKUytURFJkQzQwVVpvd0Zs?=
 =?utf-8?B?cGJmMVlMNWdDWVVpcW9KazBFc1Y3RytHcWZ6bksxSnNMV1NIc1JUY0poOW1j?=
 =?utf-8?B?dlhEMlhIZXNGM1c4NEZ2dTJJalNma0xPOVB3WllkSko5TWNEM1duVTZENHJ3?=
 =?utf-8?B?MlZYakhZYzg2U3gwMjZiRmQ5YjhYUSs0RWV5bGNsQTU2TE56MzlDNHJHNEhG?=
 =?utf-8?B?V1M4ZlQrTzV0bHpCRVRRempDV1l1T1ZmMDBvSlArZG9SWWw0WDQrRTFzQUlv?=
 =?utf-8?B?QThvR096UUxtZjdwMVE3TnEwNlFMQTJRRlA2aytnN3IwRFlUb2graXZ4WXpt?=
 =?utf-8?B?MkMxSVhhWE53S1RmMlo5R0k3ditRSUVTeG1ZL1kva2JyQnVEZ0haS0c0MDZP?=
 =?utf-8?B?akh3L1I4YmkyVFlsQXNBUjVDRGljMkg5OUtKQ1EzWFB2czJTSGhPUDdKVmFY?=
 =?utf-8?B?V2VyZTVwdGYyZ2JPSWZSRTdWNW83Zy85SWdzK2VuN1JSU0lGMnhYcWVLVjhY?=
 =?utf-8?B?VUQ1dWNPMkRQYzlQZFNlMzBEb0pKOUFaclptSW9kU25hcTFaQ0w0b1JlK2Z4?=
 =?utf-8?B?bHZ3eHpIb3JWV2lLK0x0d1dVbGlicVMxRXlFOFBaRmdDOTFqQ2ZQNTVuRUZP?=
 =?utf-8?B?SE5BeVpvdk9xMkxKZERLUUx0blJCRDJvcEVDUm15N1d6OUM3UkhyV0krV2N2?=
 =?utf-8?B?YWVubWIxV3gyZkpFRVRyMWhnbkR0S1JMR0t4d3RZbVhld3pmd3ljTXkzaitB?=
 =?utf-8?B?OGNROEhZZ1J1ZkZieEoxakp6QU9WdTZhTkhTMWI4eS91Z3l1UEtGYncvaGF4?=
 =?utf-8?B?NEVBNks0dTlCT25wWFIxN1dDcGRnbSt4TjNtTjVLNzMyZTM5dkZTcVBLbUFZ?=
 =?utf-8?B?MXZuY1hDekY1bk8xaCtuMm5MTElSVk1VZ1NrbnlMVVQ3b1dvcE8vM05OS0hY?=
 =?utf-8?B?UHJFdWhOU2FOYXEyM2xUNDhhNHh5bitKNkJ6K0MwWTdjck5WeTdwVTk2S1J0?=
 =?utf-8?B?bk92R2FURFkxcGMweXg0WnpQL250a2JIYVJkQ0dzdlNmTGZ1K1NqbnNwbWhG?=
 =?utf-8?B?WXYyOVVDQU95ZWJvSzltYTJiT01uTU00V204d1NYc0lJeE9adUNZRE1XaEFi?=
 =?utf-8?B?dXRQcUJPcUxyWm9kb3pJd0JlMEhDVktnVmdWRDArNkNUY3BZNzJkMmxiVnZ3?=
 =?utf-8?B?WWRlMXQ0Z0pCVXFvMWtwbzVTSG4zNkpISmt3R2VINnY0dHZjODMvMnNEV0lj?=
 =?utf-8?B?bjBBUW5WNUx4WXVDNEhUZEFvdGV3UzV5RnBlZTg5MjVuQzlSY0NmQzZvTEw3?=
 =?utf-8?B?RU1jUGtRelMwWUJjOXpxZWVIR3lSU0I4L1lIdlo0QStBVXZ3b29KTnByWVRW?=
 =?utf-8?B?Z2R3K2ZDS1hpYUVHTzdBK1R2Q2RpNEFmcFZCRlRoUUJ2MUpMVEUwUWRlaUFW?=
 =?utf-8?B?MThkL2I4akNCeVZ1b3BtaDJ3MUVlTWhKc29TUUVQekxudjVldGc0bk9NR1lS?=
 =?utf-8?B?MFE3dmhLK0lrVXhBS283dno1WFZNZ2xWTDdhUU9iUnljUXFqNlg3T3Ezc3Nj?=
 =?utf-8?B?QjBKR3hQMkZjSFJFQXFXWVJUYWxzT3VxQ3RxbEZ2V0RibEpObnJmcVEyc2hr?=
 =?utf-8?Q?MgWOC7BzO7NQHCNON1nix6eKL6Dtuoth0SkacgDbr944W?=
X-MS-Exchange-AntiSpam-MessageData-1: 9EYqcmidJYfJwQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9b5308-3608-43bd-f72e-08df0a8ad5f9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 13:45:52.2933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5KD88jM1H99ZB71pBLRdt9VXnSRDM8CnYw1CkMSpj5B1e8zRj2jmcoUwo12r/g2eDbQ7nbHh2ZQNHkd6I80dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7257

On Fri Sep 4, 2026 at 8:17 PM JST, Gary Guo wrote:
> On Fri Sep 4, 2026 at 11:53 AM BST, Alexandre Courbot wrote:
>> On Thu Sep 3, 2026 at 12:15 PM JST, John Hubbard wrote:
>> <...>
>>> @@ -838,23 +871,26 @@ fn receive_msg<M: MessageFromGsp>(&mut self, time=
out: Delta) -> Result<M>
>>>          let function =3D message.header.function();
>>>          let seq =3D message.header.sequence();
>>> =20
>>> -        // Bind the result rather than returning early. The read point=
er must advance past this
>>> -        // message on every path.
>>> +        // Every path must advance the read pointer past this message,=
 including a failed decode.
>>>          let result =3D if matches!(function, Ok(f) if f =3D=3D M::FUNC=
TION) {
>>> -            let (cmd, contents_1) =3D M::Message::from_bytes_prefix(me=
ssage.contents.0).ok_or(EIO)?;
>>> -            let mut sbuffer =3D SBufferIter::new_reader([contents_1, m=
essage.contents.1]);
>>> -
>>> -            M::read(cmd, &mut sbuffer)
>>> -                .map_err(|e| e.into())
>>> -                .inspect(|_| {
>>> -                    if !sbuffer.is_empty() {
>>> -                        dev_warn!(
>>> -                            &self.dev,
>>> -                            "GSP message {:?} has unprocessed data\n",
>>> -                            M::FUNCTION
>>> -                        );
>>> -                    }
>>> -                })
>>> +            match M::Message::from_bytes_prefix(message.contents.0) {
>>> +                Some((cmd, contents_1)) =3D> {
>>> +                    let mut sbuffer =3D SBufferIter::new_reader([conte=
nts_1, message.contents.1]);
>>> +
>>> +                    M::read(cmd, &mut sbuffer)
>>> +                        .map_err(|e| e.into())
>>> +                        .inspect(|_| {
>>> +                            if !sbuffer.is_empty() {
>>> +                                dev_warn!(
>>> +                                    &self.dev,
>>> +                                    "GSP message {:?} has unprocessed =
data\n",
>>> +                                    M::FUNCTION
>>> +                                );
>>> +                            }
>>> +                        })
>>> +                }
>>> +                None =3D> Err(EIO),
>>
>> This error path is the only one without a warning. How about:
>>
>>     None =3D> Err(EIO)
>>         .inspect_err(|_| dev_warn!(&self.dev, "GSP message {:?} too shor=
t\n", M::FUNCTION)),
>
> I don't see why we want to use `inspect_err` here (just to make it an one=
liner?)
>
> Please do
>
>     None =3D> {
>         dev_warn!(&self.dev, "GSP message {:?} too short\n", M::FUNCTION)=
;
>         Err(EIO)
>     }
>
> Instead.

Yeah looking again at my suggestion it seems a bit nonsensical to use
`inspect_err` from an environment where it will trigger unconditionally.
Shorter is not always better. Let's use your version.
