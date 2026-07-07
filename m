Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010023.outbound.protection.outlook.com [52.101.61.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694CC3F88BA
	for <nova-gpu@lists.linux.dev>; Tue,  7 Jul 2026 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429714; cv=fail; b=fl9xRccdfw0CZG08bPoL2nn9/6Tho+mGO4m2x5dYVmDLMFLCN2aeHuF16VHyOxd7DGKii+cbaNZHcBQLEdUNzfQgwD/JaNwPLlxTNMHs68FHcK2iSeQOmuw5A8+37FAml7IExPffjhdOS6roF4xh5ELrxmHvF/Oxswh+jkraK+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429714; c=relaxed/simple;
	bh=X1/PdmKf9ZcySdoL0ifQkcGrrGhyghDU/6JjtG7leSE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Mo3sHoaGCU9oqYRr0FjBl+qCHm9DI++YH5dAH4x9ZmiECSbh9R+u+acGc9Aqs4cC+9xw7rbFMlae3S2LHTV5p9+NjlO19u1YTY9NaoubM0KTSuNOe7nfpeJd6b2k7zVzzvkFV6o0NywrKA9m9Utpb+Py7QfE+w7d0kiczNVc74Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dfVRAORo; arc=fail smtp.client-ip=52.101.61.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dfVRAORo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxF5D/ThsqsiUe6UelnQW//JInPRScYh1vYBfbkC9bxDUNkN1IIFRz5Rqnn0S3geGxqutqzYgorsdxfs9Fdip4UbcGGmkAac+jMDGcoauDgBBYycBKcaLXBiT2Vs9UK8BWnCTY6zTPpzp9VWVuYz8hE+wFdxkUnGmTa9gQjMKHQ1t3jC00gch7aEd7hyq5ziKobUM3Y7xv5Nmb4Ss7dvX0P4BpYM7PA6YKtb4TLiRiOYFesgt+r1cM5u+R/9LLCVjOEIQEUyywhsWUNxYUQoloFDZ59cdFWK2jko4n0Hq7ZvwDKc0kZn0buTRbqRA6zBK0b4wwoz3YmHSCskxpXZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1/PdmKf9ZcySdoL0ifQkcGrrGhyghDU/6JjtG7leSE=;
 b=miVhiLV7Nql/lXUCY3D1z/663DVAgJyK8Pjzfuvuq1IkVtLTYZrowD0VkfoGYBKCA29GSqTrB+597PXUbFsUdcjq41KgE+MqXUAvYwqp0I3OLEvWugbnOXGnqw9bu32XK4vmhw7J6PLexpEUrvgjdApL5OzVjVJmkuEDeYOLOxx4jwy8KzRt0jO3HKzD2Bx3hhA5erubQ6LkVTHlEv/I5uW39NYT4wyLwly328LjjHydg8vxLpzVhdipvQAEidAwUPIYLleXBglwArPPufmW53NeLiVGfa9JB5EWsHwNY72V+/ic/EfszD1Etp/dtjh0pnaABPp+85pCjnPjXj6ROg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1/PdmKf9ZcySdoL0ifQkcGrrGhyghDU/6JjtG7leSE=;
 b=dfVRAORot1+JYJ6vwN15lyVVWCYxRimk1ujMOXrbmH26zhmQPAwutzQT/7I/pC0a862Ue1FfQwUjSD4p/bz6ydMJyBFWIjrhmx3dz8d3B3nwba92/8BmVsu5EIPJw9XtU5TNO4lhgrAeBfH1XntdXFn/VxuXTKbaEamoS/oD22fxDdwn6dwfDXZib0gegIFUPFJG4nd0atGteBfF/HpsRe8qYYI2SORvHj+qMGZLzjclkiAF+qVLJJOByK+CVnTB6n0wY7OsXXeKcQZDsR0HjLRTvIQryfN03UEhbCPg9eVfcAlXm3ZPVI73EAmS7qsXzw+hA0P9s3HxocBDEsY74A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS0PR12MB8416.namprd12.prod.outlook.com (2603:10b6:8:ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 13:08:25 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 13:08:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 22:08:20 +0900
Message-Id: <DJSD2E482G23.1RNUK6AYNDI3J@nvidia.com>
Cc: <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v5 09/13] gpu: nova-core: move GSP firmware files
 decision to GSP HAL
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Gary Guo"
 <gary@garyguo.net>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260707-nova-bootcontext-v5-0-ecad9346387f@nvidia.com>
 <20260707-nova-bootcontext-v5-9-ecad9346387f@nvidia.com>
 <DJS6AAWKLBF2.1E7FH1HJ3MY2N@nvidia.com>
In-Reply-To: <DJS6AAWKLBF2.1E7FH1HJ3MY2N@nvidia.com>
X-ClientProxiedBy: TY6PR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::7) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS0PR12MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c5974a-e6b6-4f2a-2eac-08dedc28d46a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|10070799003|1800799024|366016|4143699003|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/mrO6ABE+09Hj7EOXQCEewEhsJPyemkyQ6NwHVc9CzzF56hMh1zmM00M0CoYrqYztjdO+AM3rMQ6lAbXm+traL5QWGEHKRjgetMBmSq5n+QvT+7V4mzFfQtSBbJPl+SeqAV4U1oQfauhVOEb4+2HLhinqwQg3dB9+I82cDecO94fL+wmyoRfPeS1/LiZJTLOQDcWxgxbjSnFLKHPrBfXi2Cb5+3uowTR7BJIT0G7KagYxBBRzJODSamFuSC5kUUQ/Uj5FxBYg7S9I4aOSm72cnar34OX7uPOZls56T4ayCtigVogJYqwTkLl8YJkBWmJt6KRgoH3ZrX7sOBJMGWTT8JzNBwXGDQhvycZmacKgt78AW/DAPtBJQcUu1UmBkGlQFXqc/omTfhv5ifa9JuLAn5bQypcSdoIhEGRrRvqZTF2pYRLQV8E8QLo0RaqvC+1DmJguGe2mdjGp4OI2dme1Jwxe+c55fDUG1lUZ7K7mD3ldv5iDmwujIhosVckOXb00+NfpESa+HaZPlosz+BKdhKZsvBzfidE++INxn9K1Q/PhguJeiuPX4XCjMT+weWKefRFd3PRcsKTcoXyHfcGpYqVtHVOL2F3xwguz1ahH1bqau/Xrz7DFfc2D17PcgPDxlBmExyRWLG2AXAaygXYxd1eydTdni20j5VOuHWtDDFmYAmOwqowdMZ0bTSJe6imqT2Q9gGHDQ5al3+j+wg9Bw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(10070799003)(1800799024)(366016)(4143699003)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWFIYUZHcTJRWVpGemtOYXBrMG1DOFRTSlVDMDVGZjI1K1Evd0ZCNXJ6cnlq?=
 =?utf-8?B?Vm9taWVnclV0aUFhTHpZZ3JMZHJ4MTlVRm1tYXVoT1hva0c2cTJYMGtnT3RE?=
 =?utf-8?B?RmtOcVo5QnBkVGk4em0relRyN0RPZDFGd0I2eGVIVVk4MUx2elJNNHBBeUNv?=
 =?utf-8?B?Q0gzUXJiSVU3V2tsZFNxb2wzSVQ3c2w3NEVRR0E2SzdzVXRDWWFrTDJwWS9r?=
 =?utf-8?B?d293VHZrUXVTc21uNTNpRHRraUF6dnRxY1lyMGhSa2Y2cEEzbUtHMVZMTGNQ?=
 =?utf-8?B?enFzZSs3TytqQWVJRkVPNS9wQUJtQ215SXZHczBGckp6U2xDYjhkVTJIdDg1?=
 =?utf-8?B?UithRWtDS2g0ak1FL3piRXh5eC9JQ21najdXV1lhaE1EamlYWE5yWmdORkRE?=
 =?utf-8?B?N2FuUlpZSWtHRmFRTDdYUXYyTWl1N1BIUXdVYlZxZ0NDNndRaURKUEJwOS96?=
 =?utf-8?B?T0xrd2p6SFRod0hKWElNZHg2NUxheVFTMWc5aWdoSlVpdjg0bTVXOUNLYkRr?=
 =?utf-8?B?VUJOR1RZZk14Y2tlR2ZYQitObHE5Z1hpdGRtclE2cEVJTUlWKzZDdTFBalVL?=
 =?utf-8?B?MWVCVEkrWkxSbW8zYldCdXhqdHViMWNzVWhsU2lLQXo1bmtVODF1Z1lkQ0dS?=
 =?utf-8?B?RS9RMGFSVXZHZ0o4UFJyR2h6cVF1bVJNV2lEQ3k1bmdEelZFRUc3eGg3bGFr?=
 =?utf-8?B?dmVDeTJnM2oyWHg1U0lBUTBZNDFCZzNHMjArdWNPMWtzNlphOWJFQ0tXekhE?=
 =?utf-8?B?MkpmR005QWpUSmpyUkZPUUxFVHgzS1kzK05wT2Z1cDZRRk5rUENoL1lDQzY4?=
 =?utf-8?B?eEgyZFdzbmgwbGx0RWFTaHFHcWR1Y3VKdjFGR1N0eTZOaUhZcFFZWm1zMDJq?=
 =?utf-8?B?cTZqSzJud2g2aVhxM1hIaGtTcXlGeHlJbUY2RTNtaG11bUFxdlBJKzhmdlI1?=
 =?utf-8?B?Vzc2T25yMW5QTWd0MjN0UkpKSDZuM3UyRzdpVDdpUzkzaWhhMEhFLzVuM0Jw?=
 =?utf-8?B?UGZoNFozak90NXJIT1l4QjYvamk2ek10UEV2dDFMZnVYcEt5VG9hYlVvTnRZ?=
 =?utf-8?B?UkduUk1rV1VweDVXeEt6NGdkUlJ0dzFPWlNZbTVlc2xOYzI3TlBha3VJTHFr?=
 =?utf-8?B?VFpWRStLTm9NS2k3YUhFTC9BOVV2N1dTak9WMDBrYnBYNW1MUWFqTDlZUHE2?=
 =?utf-8?B?azM0MXJSMlByMlFWcGRnZXhkK0pQaGk2bCt2RFptTnl1RTdtNGVwalU0SWU3?=
 =?utf-8?B?OG12bUp2Tk85bXM5MyttWExhVXpVTUpRWWtZYkwycVFwTzdPbVNCdDd0aWpp?=
 =?utf-8?B?R0dKeTJFSkY3aXVFR1pneENJOHl6S2d1TmFDMFZ1WXJDbjRsd2t3MnhuVkto?=
 =?utf-8?B?SVYrS0VZR3ZaanpzV21rczlkVVZ5KzBsb0xYWjMvSFIyZUhXOWNVbVl3VWRP?=
 =?utf-8?B?dlRZWnA4TzRWTnlMVEMxNTFaSkRuVXlMOEJZRjNiblVMdHo4dUs5Z0hsdUFS?=
 =?utf-8?B?TFF2QXZHdS9wcnpLeW1TZWRrdVZvODVDTU9aNU9aNXBaME1Lcm1IcVFOcEU3?=
 =?utf-8?B?WmJpc2VMdi83QmNucnRCMWx5UEcvdFdMQzg2Rk02Y0hEMzRHeW9uUzVJMXUy?=
 =?utf-8?B?eWQ3NW1xYjNNQ0pVMUxYTFplUTdTZU1yZi85anhKTzdQRHp0WVRMVHNoRTk0?=
 =?utf-8?B?ZkQ2Sml0UGtXZ0dtK1Z1NEVmenNlVVVWcHBEUnMvQXdlZEVtV1BxUXB3TWxo?=
 =?utf-8?B?WTg5QVlSK0dYOUw2VlZqSy83T2J4QzB6REdMVSs0Umx2UmdLam9zUGh0Z1Yy?=
 =?utf-8?B?eXpZRnpmS3BhVC9jbkUxbTF5b1BQeE91aUlBQytzWnBKcTRGMWhwdkdid1li?=
 =?utf-8?B?N3RZNXRNOE1iM2FCUE56SDArTFdkbnhRSm9hQlJFNXRxSThBTDlwSXV1YWRy?=
 =?utf-8?B?SXo2NzFqdERhTjRrOHRNTzlaSWplTm42MEJsZDh3VlBqcGdTd3JMT0R3UlF0?=
 =?utf-8?B?V242ZURZY2lVS3ZDSExPL1FVM2tYSUFkcTBKekJXb09INmdKSllxWitPRVFu?=
 =?utf-8?B?Y1FOK0pVaDMwOE4zcGNXV28zbC9VMForNXB4R0xuUlhVa3VHVE1WaWhOdUJv?=
 =?utf-8?B?QktrT1hBRVZyVWRpekdrZDB6UlZFcVRBSjdPRDAyM25Iak5FMHE1UEl1K0Y3?=
 =?utf-8?B?aFVxejhxaXdFdVZDSXZhYjU4WlRGa1A0RTVMQStNaXoweWxxNmVUVjNZNExX?=
 =?utf-8?B?N1FxLzIzbzN0a25aNHg3aDVEeEpNei9ZZmg3UFhBb0RDTllneW5IVDU2ZnBw?=
 =?utf-8?B?UFlrempPd0d3aFNUc3JkTmYvbHZvY1ZNckNzb1hNT0xYZzBmM3hpSUJOczRw?=
 =?utf-8?Q?bV2iy7mPJ3qup6kpM2/NTJEPm8kM7yzpQlcJWs6eftU0h?=
X-MS-Exchange-AntiSpam-MessageData-1: hmzFUrcLPFZIiw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c5974a-e6b6-4f2a-2eac-08dedc28d46a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 13:08:25.5172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5iroQYpbW7HhGrxZUoqqyZXsGOclfh91/AgWmJdQiy3Y1haZsRNv8qXIsuWCqqoN24k+Lki9wKvc+QWncHAdKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8416

On Tue Jul 7, 2026 at 4:49 PM JST, Alexandre Courbot wrote:
> On Tue Jul 7, 2026 at 4:21 PM JST, Alexandre Courbot wrote:
>> From: Eliot Courtney <ecourtney@nvidia.com>
>>
>> The files to give the `ModInfoBuilder` depend on the chipset; this is
>> HAL information, so move it there. Doing so lets us remove the
>> `uses_fsp` and `needs_fwsec_bootloader` ad-hoc methods of `Chipset`.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Eliot, I put you as the author of this patch since it is basically the
> diff you gave with very minor changes. If it looks ok to you, can you
> give your Signed-off-by?

Yes, lgtm. I guess I just paste this?:

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

