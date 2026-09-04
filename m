Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013010.outbound.protection.outlook.com [40.93.201.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0948947F2C8
	for <nova-gpu@lists.linux.dev>; Fri,  4 Sep 2026 10:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519226; cv=fail; b=nr9yEkD3/+QXtR/6nmbbeSQCxHOn1ZCWLZsxINfXoDUUNqcULGKyeiggEVv1+onFHiGtwsikdgw0Ud7WXeqKdqJLySHZeZbHc7aE8Z1fMQ5DdBDLOSBk8TLSEncD7STQ/y241zb9toAlp6AG+GVaP8Nog/14PtdCkdclk00F9Wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519226; c=relaxed/simple;
	bh=tCXYbNdCuaOpM07F0FU5m3Vz+vCqd7dohPH3pi4FwKM=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=XximX8mAr5WH0zgqZuuVP+VS15Ib7xXJbOtRUITGhr9lrj3mElrck7ML3tF09ffdILJElN35Y2xF8svaVrMjoqkdSFAejwUFrO1hczprit5fT5ei85+YpLawJXT2eBoipselyeZo9fkD5wk4p537q0l7vTTEY0Y8U5u+Nz8XPdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kTXDI2cs; arc=fail smtp.client-ip=40.93.201.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kTXDI2cs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jftODnziXHpeSd1AziKSK5OpjFO7D3vvlA49jMZFvM+riYqGuRaDvX+rTJBskDcvDf4ZfedeAm+BrhTUToIai9xHKtZutNLYtgFeZEeBOegYnPudp+9FK02mb70qhoM+M/5KhdUEYf+2U0M55us26L8j+v9aAQ7pb848z7V9vMILtV3n12PaH/HqfFgb4+d/UvWqCPIDHAz5FltzNgnKv3iv5Y35uhxdGpMcTurid7oAUX/vS8F4tVguDL0zdebJteJ0PuprsiMZ118w/YAuyC9dNvlORdyoyweUEzbfnU+iVwYpmm1+RZig0cz2c2KFGZaOVH7xo0Xe04b8/BZDvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zN6uofMj16eHBbA730237gKWlD8EWmwmSHsSODU63Q=;
 b=ilKdFv7fcobkNWCQEMDC7joussL/QnzHQ91z+pAy9g4KW1zDgZuk9yesmf241ImOyJDlIj7dYWiOLtyDf03AWPMGNusjYPzJ4ivb3uheEj2VxT6OgKMPkk3IyxVi1GhFBU7PS94HMth6C2jUQndIzsRv9JDHwU62JIB8usobxvIqzgDX/7kT4wZcvPrIUfU24sMzw0CB1wVsj3rNfLkfhR85tw+Ae4LrV0w/Xqrq3Xtp9cFvNmb9RbMsoU+NEgptWuCHgr5FAKhA2/fkjEsXpbHjKocLWSv7og3NYAg0y9ay44UsXvkJptZbbjL4Tizjd1ikafwRLfZI/IpgKJIrNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zN6uofMj16eHBbA730237gKWlD8EWmwmSHsSODU63Q=;
 b=kTXDI2cslAXirxfG4RS+6AX8F04MA5qQY/CfSyyApOdM6frhozk7rHkERTXpZOvrgpW9z/HlqkGgbAvSyCMtbxNB5PYoEZmGnJkwHR8pjW/3Kp0rdRTwJEcWBpAfM/ljjjWqvoq0YEBeck0B1tADpDJeuET62+Y6F8RKmgYbl1fwQkApHl/bBNTK7jrCkQEoxtD7a5Y385Y2bB5tNytDGgQkNsZwI4xPzX9+RpiiKs1DOU5ZV/y8PcuR1FrgSrqLkyKKDy6WgdYtMj02QyS07DuUqyOKWa3Rqdys0kqTI3s0+WoMxz52lQiHuBAg8j/eyUmafLwo3ADrPSTlquMpKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA0PR12MB4496.namprd12.prod.outlook.com (2603:10b6:806:9b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Fri, 4 Sep 2026
 10:53:41 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 10:53:41 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 19:53:38 +0900
Message-Id: <DL6H5DZZH2LO.2G3VISAA35F0T@nvidia.com>
Subject: Re: [PATCH v3 09/14] gpu: nova-core: recover the GSP receive path
 from corrupt framing
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
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
 <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-10-jhubbard@nvidia.com>
In-Reply-To: <20260903031514.1515905-10-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0080.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::10) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SA0PR12MB4496:EE_
X-MS-Office365-Filtering-Correlation-Id: aef80e9a-ff19-4b84-3cc7-08df0a72c7df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|10070799003|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	43Q129KJeD040qzfkCdzBPop/kAlDq3QZJNNVYC9Xr2qx0BobTZoycF+RuKdg5baF2UbPZ/qYGP7Xh4FkeC1QI/C7w4mxkXJpzmAH657gNyWgcVTs+qIiZD+zaO2j6XzLpgiK1kJ/DiEDHnpyEJRLOg+mV9Ou0x+3fVIPt5FvUMHg16Q7L5GIDtrmlZANR5UOJmAnfzNX60DuirbruNud4zIwQfJRewWcd4VdsxGIjs9hRBwHMkksLbAgPt+gkvb4xN3QWtsUP3v2lwbWOhOFRdej8lG7ueJG0JeklKpv9PgFS5pNU0LwcV3L6P4B2EMYwChqZU/M7RLMOR001lpiwvzsZHjvFWcK3dSiU1zbKI4BN2xL6L4H1vg+k2dC59BBex4pPdhJkcf8xLuDy34RR0eYPwgm6q28bLqqYUqbvOiZFR4Mb9YzzjbNMYfRsC1vy25y1iLIlkd0YlB5EzMjJPJDarH0CtXwn69uRB6OEQNQUebE/+l/kJNH9LfwqBdNjjLgUsdQ2gLsEOEGKFKI/Pt9Xsswb0eDfzgoaYwXSqxQ4joPNxe3QjedXC5NBU9phcAzmvY0ykT+7DbMrYFA9hHjacHRYe7oTU3o265oEsvxxFzhuL5o/D/8k6mvZtilLDKVmJBiugAKbomZq8XLHaBhwdK5wIusFkzqDdPmGQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(10070799003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWZmaWlETjJ4Rm9uR0F4VkJiTUgwSXFPRG5JZU45b0dKdU9OdDFXVXhXOU5Z?=
 =?utf-8?B?K1lhSlg3cUhGZDlUZ2gyZGI5L0JqeHloOStwdkc1ZFJGN1dQTnhSdTVrS0pJ?=
 =?utf-8?B?WEdJVWY5WjBYY1RzRlFxYTN4TzRsZ0N4UTFGUUdvTSt4aW0yZTFVVmY1cHhC?=
 =?utf-8?B?bFdoWnRTN21MYUtYR01tY3Q3NmpVY3QvREVkMU8vUGI1MjIvRnhnQ1N4SUly?=
 =?utf-8?B?Si9xaGJLek1SdXVpNVpDSHpGTnZ0LzlHRWlXNjZ6MW1vek5XV1MyOTlNNVJJ?=
 =?utf-8?B?RENmQnNHdmdQRjBHU2pNVGIybm8vbERCSUtYV0drMVBhRjlXQVhBdVh5bExX?=
 =?utf-8?B?UVEyWkRkWFlmSGxYUi8vMDF5ejYySnBTMFFPL3lEalZtcG5uaVJ1cko3OUFh?=
 =?utf-8?B?N3BHclFsNW9Va3hldHdGMHZaVTNNTFFBbHRqVGxuck1KejVTREVzeE5OZmNG?=
 =?utf-8?B?bk83UFhRbWRFODhMeC9aNzNKekNQYjN1S25wT2hod041M1R0VVFhYVF1ZGVM?=
 =?utf-8?B?NTl0R3laTDN6U09pclJNR3draDg1QmNrVEpNWFdnZWhXM3hMREhYWk1tdS85?=
 =?utf-8?B?UHdhazY4bHJnTlR6MFpHejdUYUZtLzlMTDJ1d1NING9RVzcyaG9RR05yK3dz?=
 =?utf-8?B?ZDhDRU1EWDMvWDBuUTVRa3dLaXY0NWE4YkFkRmZraUZzNzVGdlh2NXA0ZVJL?=
 =?utf-8?B?QmpsMHJCRVhBanA3RmxubU4wQ2JBN1cwRFZ3RUpSQzljL0NGL3g5NTcrQjJY?=
 =?utf-8?B?TmU5azUzQnY2S0hQdEpQNUpFUDJhejVkRnNvNlNOMmJMTG5pc0x3cE9vRk5n?=
 =?utf-8?B?NlR1RktDSWpFTDJHMmhSV0doTEdmMXRwZ0RadkQ2NS9oZVRTZVVDWUQ5WFVl?=
 =?utf-8?B?SDExRUFBNGwvQmRvOElac0Jqd3c3V0hwR3BCSWdZYUhHY0JvRUFic1hwRXhl?=
 =?utf-8?B?T0ZQbkM0bUE4YytQWEVqZ09EVHI0RVpuY2J3UUt4emlIeG8xak9jRWR1Yk9t?=
 =?utf-8?B?M3BacTdvSTc3eDk0NGlQT2JGZGphRW41ckJBaG1hTDY2TUp0YUVSYWZFd3JY?=
 =?utf-8?B?WXM4K1l5UkduTGxwMkwrc2xyZnhpdHFxR3ByS1FjRzE5VFNiTEc2TzFGZC8w?=
 =?utf-8?B?MXBDY0pIcDZidnJNU3l1dStOVVB3T1pXWlpOUEtSOXB3bkd0UWdzSHU5OVNZ?=
 =?utf-8?B?OHhPNWFMVFFGeUxVZ2VaOFFpdGJ0MWliQ3pPT2VUT2I0YXR1c2tJMUxjakpK?=
 =?utf-8?B?Z1hqRUJCUk5aUEtGRFg1Nk90QklOMlo4b2Evdzl2ZWMzNnpyOE5UaXpMMlZM?=
 =?utf-8?B?Yy9MR20vM0pQYjg5QTVKd1FrL0duVSs1bGtLUW5VQU1sTXBuQUorSzB1SCtF?=
 =?utf-8?B?YVByNWZWRUR1VUZIY2hiSW1LZ0VsbnhiOFJ0eHhWRG9qVEwycnlUN3lYcHQr?=
 =?utf-8?B?bi8rVzRKWDgyUTBtOE1YY3BtOE56V21QM3RMYk1pZnVWTjg2Nks5b0hHL1kw?=
 =?utf-8?B?YURmejl2YXVTZWV4R3FqZkR6L2czNXBiZ3BNSDMxSWpIRzNQbTFmRWNvVEMw?=
 =?utf-8?B?bC9KNDF3aUUycS9DQ3U2TVZ1SzQ1b3NHeGNYN0MxN0UyRXQ2bUpSMEdXb2pI?=
 =?utf-8?B?a1BOL2p4aSt3eUxXUGFnN0dIdGlFQWFuYldvT3E4aUZmYnBBeW9DZ3RxQUk2?=
 =?utf-8?B?NlBoNzJKTlYwUml0TTAzOTFuRVVNbFBod1AvYlNuZWppUStHWkFlYmxzcVp4?=
 =?utf-8?B?ZlZaRkFLUXVRSTB1K29SbzR5dXBkWWthS2pFaThMUURYb3ZYKzhIZGhzN2JP?=
 =?utf-8?B?b1ZoZE8weno3TXNjUnNiaFNuWGdTZStpYVNpa05OM2dXU28rVnRzSXc0bDB1?=
 =?utf-8?B?Smh4dVk4V2ZSNDBmUHJqenFYRTY3ZzlaNUl6a3duN2ZKYnpIMGYyWU54YWtj?=
 =?utf-8?B?K3c4b1ZkYXBQcVN3QUora05FdkNFVGxWWVhqeXhkdDBoUFNhVmt4ODRsWGY4?=
 =?utf-8?B?Y0FnN291bjNQelFKc2pmRjhhRFNpVUJ4ZWJGdGhrWHJYbE5OYTc1L3lhRFBy?=
 =?utf-8?B?SGRuSSt3VDJwTnM5Nm1aYjBDVHdQbzU2S1JwQ1F0VlMybHZtNE1SSFlBd3NY?=
 =?utf-8?B?OUxzRERrc3k5NnBoRldlRStmeWR3UC8rTFF3TDZRVk5NQXFsY1BiMXhLNmhp?=
 =?utf-8?B?N2VMOGN4bVVnTXVYL2hlQm5oWUdib1VublUxRzhldjhsT3Z2NHU0bWhHWFRx?=
 =?utf-8?B?VzVGR2pVdzd4R1hLNEhsdGN5VWgwL1doVnh2THhKZEpQWWNCemdEQzNNVGxl?=
 =?utf-8?B?dFgyVWxydWtvcTl4VVBCL3E2UUpMVXF3WFRtYnZqTWo5TGRaRUxBaXNQNTVW?=
 =?utf-8?Q?V/cLv+K767DfjjtP5+anUGIxR/GHCT9qqckaOXphNK5FA?=
X-MS-Exchange-AntiSpam-MessageData-1: YfEVpcDYYjj+Cg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aef80e9a-ff19-4b84-3cc7-08df0a72c7df
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 10:53:41.1732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: niFeCbZVxaGRDTcbjuYuKaXb+rsxoSXen46Mpm1ig8i4PoKaVv4UxGjFDepsJi0dsTQvrN5tYynVCVBnsl4MiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4496

On Thu Sep 3, 2026 at 12:15 PM JST, John Hubbard wrote:
<...>
> @@ -838,23 +871,26 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeou=
t: Delta) -> Result<M>
>          let function =3D message.header.function();
>          let seq =3D message.header.sequence();
> =20
> -        // Bind the result rather than returning early. The read pointer=
 must advance past this
> -        // message on every path.
> +        // Every path must advance the read pointer past this message, i=
ncluding a failed decode.
>          let result =3D if matches!(function, Ok(f) if f =3D=3D M::FUNCTI=
ON) {
> -            let (cmd, contents_1) =3D M::Message::from_bytes_prefix(mess=
age.contents.0).ok_or(EIO)?;
> -            let mut sbuffer =3D SBufferIter::new_reader([contents_1, mes=
sage.contents.1]);
> -
> -            M::read(cmd, &mut sbuffer)
> -                .map_err(|e| e.into())
> -                .inspect(|_| {
> -                    if !sbuffer.is_empty() {
> -                        dev_warn!(
> -                            &self.dev,
> -                            "GSP message {:?} has unprocessed data\n",
> -                            M::FUNCTION
> -                        );
> -                    }
> -                })
> +            match M::Message::from_bytes_prefix(message.contents.0) {
> +                Some((cmd, contents_1)) =3D> {
> +                    let mut sbuffer =3D SBufferIter::new_reader([content=
s_1, message.contents.1]);
> +
> +                    M::read(cmd, &mut sbuffer)
> +                        .map_err(|e| e.into())
> +                        .inspect(|_| {
> +                            if !sbuffer.is_empty() {
> +                                dev_warn!(
> +                                    &self.dev,
> +                                    "GSP message {:?} has unprocessed da=
ta\n",
> +                                    M::FUNCTION
> +                                );
> +                            }
> +                        })
> +                }
> +                None =3D> Err(EIO),

This error path is the only one without a warning. How about:

    None =3D> Err(EIO)
        .inspect_err(|_| dev_warn!(&self.dev, "GSP message {:?} too short\n=
", M::FUNCTION)),
