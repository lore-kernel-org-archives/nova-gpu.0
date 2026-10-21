Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792547806;
	b=NXQmVQSroVhKLYGuaUhoE2rRFeh9Ik7Df6cjqoZLy2N08bf/FHcxkU9z61T4nTnyvrLh
	 rqo5kiuVQ5gkfvn4lL2Q+0gWhj9fHnehu8z3eSNSOVrhLl7haG9Fb5DyBc1iTAr5gQvlc
	 sUQ7Na+290FgpyB89oblZLUFzaKoNCrGhY4Kntd7P9uY29JiJKi8BpZQdYHkX54MPeTfZ
	 9htxADxWXz+5cv8QnLMOB0dQBqtedB5wrChdbRTQ82eK6VPMzihag40zyniJEwZlsouAx
	 zmMHu9f3kDPTJI2O9nMeUKckRGZEk8yECc8oUQQWTc+7n3usu7iN4NxKyZc7uzNjk9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792547806;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=2GNx3PfF4J4kqsaz/3IHoQkrbZMLw8CHbt6DAHULSbM=;
	b=y9q3jyxeYGgg0AhqvHkx5nb4XCloU/gs5Ohdgd5YCHg4GebpXPU+065iEHZpBoL1nT1t
	 VEe+NMqto575x2orwi2OUxu4Cj9JRs3NytjOZ71Uk/TM6zXhFphu8S91zTi0cdyhvLfMc
	 epe1FSp0lrkOjb/rCh7GDgvDeAhWj29QzYMeRw5RwagtZZt4zqvoP/G5kBjuSb4Vp7C1g
	 N5EPnqKP5exxysgPIe4iRPtgXmdfEMaLtj2UGP3ZDDiBf2unrOW8tB1/lYiDa+gcYcxDH
	 Mg28njgRXuy8XCMAKYGgmVSg9LqMa45NNg1P7c1VpG4ZSjyy7O7DAA48JI9HWLEMCZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="q/WyrDUT";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.1
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9545A606A31C
	for <nova-gpu@lists.linux.dev>; Wed, 21 Oct 2026 01:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9545A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=q/WyrDUT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JosL2uPxw9PF3k/uRY2k5xZ1+C/vYMN80jeq1okARy0gSfHEOC7W1wXDA74KyU5tay+MeLZ1Wq7BKcqJ6TUaqUC99nnTStjx27n1C4mDrzSY4y4GB12zuIk2WiQ3XfiZZNKGDerTamAWWTWYd2ZdUVO0/2VkWG9zdLwzrxIAfk95lf0fmNiYR6IftLDduAf6kqGK+2Qd4kHfVr5rGxSqqubw0V3/EUYl5LJ18fvSzImJEyTglOjPRrD0VZa1mx6zZPwzY2wEo/aRZJh0nwCMMAyh5HA9Ue5YDAjh469ma9fcrmLbDQBMs+Gn8EqMo0HNK1W5tLFfLiI9mAYl6YdhOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GNx3PfF4J4kqsaz/3IHoQkrbZMLw8CHbt6DAHULSbM=;
 b=IOLKMu5cUY7adIhQF55wf6UFmPZ4ox5/wkPlflu6aEWQKCx5Y9zyak8tHk05/uHn+izu9b5CTWZtGHME9l72Zu6p3htUhtBU0D8nqiD7fJOMbsftvbXs4uphkZpytwUa58aj15hmzs2hqVm+gXbCCX2QA9/gvXJSwzRgS41yJcWJYTLUDSVUfPkQSOcI+3RiwyKznuEQbEj+wlZI+ALLWShFbA6PT3bbeV3j4uh/G0TAWgSDnZfx6qj3n1fCTemaaOC21y7s8Kaq6Ys56e/vMPyXk5OPlfA9ADsVQnwlFPtcA5aSTowdo4KUyIDM6sAxHddh5zbL0OllRfr29ZQw+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GNx3PfF4J4kqsaz/3IHoQkrbZMLw8CHbt6DAHULSbM=;
 b=q/WyrDUThE51LmH6dbJmtVq2w/6OpKyo2i1diCkBkKuhg+ksEVCavetIFOHK9K4oUFmAnKK0IXhPA+1AGruT83RTTqAfljuvGsiJjiFaBF3JsceD2+cUgPmxcfRJtG5htHAabtuBYEBL7ImD+lrKhS5utvZafbz0YslC6e5OAmcijGtsTCiJScrKTmE5dWQBnY1LHclxLECJcoT+qlsnT8FeL379DfzBwVf6PY9QSsT8khPydWmP8maSkQai1z5athc4naDx+KJDj5b958DSXPyR+Q5Kf0LhCD995EEcPrh60cXHj5ZYbowUsPCPjGN7QqXnxaW5HN6o7hm0o4Zyag==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 PH7PR12MB5925.namprd12.prod.outlook.com (2603:10b6:510:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 01:56:39 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 01:56:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 10:56:34 +0900
Message-Id: <DMA55SJ39DQU.2NWD9I1FRH4Z8@nvidia.com>
Subject: Re: [PATCH v5 09/14] gpu: nova-core: gsp: cmdq: split the transport
 part of the receive path
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261020-cmdq-rpc-v5-0-dceeb8f360ec@nvidia.com>
 <20261020-cmdq-rpc-v5-9-dceeb8f360ec@nvidia.com>
In-Reply-To: <20261020-cmdq-rpc-v5-9-dceeb8f360ec@nvidia.com>
X-ClientProxiedBy: TYWP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::23) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|PH7PR12MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bd6cfc6-f5df-436b-c84b-08df2f168b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|10070799003|376014|7416014|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Ac/a/AIpkDWeDev2crKiYzN3S6KcklxTqX8e7jjNzM9rzYk7zgIEEJL2ODGm01zbN8yPXU4YJTbqew25CumnKeMZu0kAh4bHUtFw+CkHO8uIVN3pW9jOSJtmuRv8QqOmpmtm4yJU0SpYGjE88QWSOz6HFfCdxX9THm9WumaMClJQPvp298jmvAFF9aShZWRBMHu7/BwogceiwgaNpq2vqkDQLjvcWKx/JINggi4sweb0pZixM4F4VDK9ZBR6ZoLwZfZcL2hicnA+mYU7Pg3z3r/cJpcfd7TztP2vnMNTLzzMluCElZvxYa2b9FPlwmgH1j+rLLQpF3MLW+yH8MPEqJIOLzzWgENslJWnro0HTNf/jqvcEmjWwGU6BsCTVatNZFkZsNhdRfa2a7jvHKNgsVRdxnSg+tJhp/4XeclfOkDxPsm+mZF7w+td5qcJBsnjr1jIXFi/oPbiwsTX/PzaS+dWW/4lhI+VxSUxxTDAyyDyq9Xj1tO7hd7WYKkUUjM838M65VPLhEqDbKepl+5WOR2YpmUkSMkJDJ9v1MB9AzyMdh1yknnen1z9O2lZ+rT99Req1CIkqheh+yGbk0EbMkPhq6cgvdPijTcofmK0d6PXGngCUg98h+WDySXQjTwVfIPTqbK4aO9zrmfnVSdTl0ehAsMZ9Xplw4q1JWp+tcM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(10070799003)(376014)(7416014)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlR1MW4vdndnQUVFQ2RWVnlXeWZ0U2lLbXJodVhDMDJ3QzYxcnEyQXlSNXJo?=
 =?utf-8?B?K01WcDB2S2NycEloSXNLMTJKS1hqeHN3T3o4TWFRTjd0ZWFrK2N1c3dBUS93?=
 =?utf-8?B?czduTURMMU1kR1ZpRWRrSy93SGxwdldJNEZqTkt5R2FQN1pLbXhmZFRsaURJ?=
 =?utf-8?B?L3pLOGttM21FdmhINlMwbjRsQ0JyNGJPZ3NsTjIydEgwT3dnMm1reWlvUUQx?=
 =?utf-8?B?ZUhqYzNmMi9nUEdtNkJmM3diZHhZazN1OXFNUk8vMWxKM2JYLzhBWG5wYjBH?=
 =?utf-8?B?azNmL1VlQXpiSTk5SDJSV2k0bWk3NnRUN1dwVzYzT25ZUzZUWGhaTkJ3WDVv?=
 =?utf-8?B?WEdjcDM4U2diR3FYU0V3eXF4NU01Vjl5eWJkT0tWT1UzczZjNlZPaHNXRHQ0?=
 =?utf-8?B?M1JrN0xFTHF2UWJTSFFpWnpic3lwR3IxWXI1OU00TmQ2TEc0V1IyMGcyblpE?=
 =?utf-8?B?aHZhMklSVWo2K1dmbnFrTXhGakNoSW9VN3dRTUFlWTRtYU44dVc0dHB1Skxn?=
 =?utf-8?B?NURuUElLeDllTC9xV1c1aC9ySjRkTUNhaHNFamxOQVFFcHJ5a29OM0lTZlhV?=
 =?utf-8?B?dEozc2JnckRHN3ZsMEtWQUR3bU80UmYyT3RyRU9FUmlhV1U1ZkI5blpVRFVB?=
 =?utf-8?B?VHNrK3piQkF0VVI4ODVqeWxZaXZhSCtLUGdEUnRaczMzRnIybDhXZ1Q4UjBK?=
 =?utf-8?B?NTRTb2Z4clZFSjhTVDdPNWIzUWxqTEI1YnM0ZW1oYTk0eEhycXVEZlM5WWdE?=
 =?utf-8?B?UXVWcFNKcUw5Y0s5VUNYUllNUDhtbEJaOERxQ1lid0J5b1Fxc09nSlZzcDZP?=
 =?utf-8?B?SUkzd2NYK0tCMWYvT3dReFlpL3lYTitaVHMyMURBb0FzZERXSHRNRlUzMEQ4?=
 =?utf-8?B?N1BjWWxjWU4yNERVRkJ5eWlEWWQ2Tm1zb0hhbndJUDd4VWxFU0F5SjNleWVx?=
 =?utf-8?B?cXZyWVVVZzRlYjdkdDIrKzJIRllCOFVXTVM4T21PSm9OVW5DMllSYjlNZ0t1?=
 =?utf-8?B?TjQ2L2xYMUx1am96ZnpnelNSNDV1WUlYM3c2SE5ReXJGYVhmc3VIRWdoSjBH?=
 =?utf-8?B?SkRCcEN2eERuWlVWWUt4WlZ6VmdWeHByaDNLZVRsdDcveGQ3TzZsNytLVG9B?=
 =?utf-8?B?VU04NXI5KzBiVlZVTGlFem9vWitnY1g5S282aGtVM0N6SEQ2YUhialZKc0wy?=
 =?utf-8?B?N05EbzNpSTltZHhXMk1zazZyazNwclRreXIyTHBWK3Jkemd1MVpKdWJsdndI?=
 =?utf-8?B?M04yQzV1ZFcyYTViOFpwSDJaVGtDcW1jVU5HdCtrbys3UkpDV21zMWtjdDRN?=
 =?utf-8?B?SFJlWnRzTWUxMWdMVWpKY2l2STh3aXRaVXlEMENhU2gxbElhcXc0YW5ROHlj?=
 =?utf-8?B?OVE4KzhBSWdUekgwcUxLQVV0YlV5MDY3Z2g4cUcyUmNaeW5FaDFKbjBtZExz?=
 =?utf-8?B?RHNWbWlydks5bjc5YU1KaFhvTkViNW5SSEhscDlKRkZMTTBuNWJnZ3A5bmdi?=
 =?utf-8?B?eTYxNGt6azB4V1NJNFJ3WWJGZ1NvSUp5eTd6UDNBdVc3TlJGamY3VGVuK2Iz?=
 =?utf-8?B?Zk11MlliVkpjSkZ6T3JFYlFLK3hUTkMyUy9HYXEzWGZXU29UU0c5T0ZGM210?=
 =?utf-8?B?VHVqMWZzb0pCWkRKdnc0SjF6eEJLUkw1SkV2eDgxeG1iei9zS1J1SW5peEcw?=
 =?utf-8?B?bjgyMTFhNXhFSzdGbmx4QTRZdUhmdUI3VXQycWp1UFpyTmJyZ3p3VGJEeVhN?=
 =?utf-8?B?eEpoVy85K3VTYUE2QjlFeDJnRk5Ib2c4cTZNc2x6QWhqbGVuMGRuQ1BhWHNG?=
 =?utf-8?B?REtyL2FpVkdCQ2c2Zk8vZ3NUYVFxbU1FUDI4OWZVelUzWmh1STNnVFU2OXpJ?=
 =?utf-8?B?VGlvbUdUY2haYTg1R1pMZ25XUWp3cEpUaUpEWHJFU3Aya3Q0ZUtXZmhoRUVu?=
 =?utf-8?B?NDd3QktvQTAvQ3FGdTRLaFQ5ZWNKSUltNmZ0blhSNisvTENTNkxJTDFYNndp?=
 =?utf-8?B?OUxlRXNGTStSTy9xeTRuYktrNi90VjNYUTV2SlR5R1BOY0FjcTA1MjFmeThF?=
 =?utf-8?B?ZEtLOTNBMnlEMWxVRm5JZmY2NDg4ditKV1EwVDdzUTZqR3pvcDNIOVBQQXRs?=
 =?utf-8?B?amNyTkQ5TkJTSXhyNmYvSVdZZTRmNzg0QlM1aHQ5aytDRXRHanVCSFhjTHBD?=
 =?utf-8?B?ZklWUEJ3akY0RkJNaElKOUsrb1N2R2ZrQjNwRTkvMUxjMVRDVHI0YlRYTVVO?=
 =?utf-8?B?cUZlR0o4cWdYQ0c3TlNlQktob1ZidzdtTGZZZ3J0d3BBMVord2NSMkxPMnFQ?=
 =?utf-8?B?NFN1c3ZrcllZL3lVOEZQUEF1NVRJNnVCTmhwTjRDbXZtbFJxN05oTGVzckZx?=
 =?utf-8?Q?Yyu5wY3H3p4/CMBaRoR4EzrTluRgMaNQPPl2+2QiR3wyV?=
X-MS-Exchange-AntiSpam-MessageData-1: hDiLBdomZTpqvg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd6cfc6-f5df-436b-c84b-08df2f168b69
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 01:56:38.5968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90U0RkwVCK/1CDceA2ueiE8ROwnPoI1NVwfyeeV4JJjRa9WexvHcDn3DP6nhxlGn8HFv22buMM3JazGvBFfU4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5925

On Tue Oct 20, 2026 at 7:08 PM JST, Alexandre Courbot wrote:
> `receive_msg` currently handles both the transport and RPC layers.
> Retire it and split its logic between the new `consume_element`, a
> transport-level method which passes the parsed message contents to a
> closure before advancing the CPU read pointer past it, and the
> already-existing `await_msg`, which calls `consume_element` with a
> closure matching the RPC message.
>
> This introduces a small behavioral change: a matched RPC message that is
> too short to contain the message component itself no longer stalls the
> queue. This behavior is justified because it fixes an inconsistency:
> unmatched RPC messages were always skipped, whereas matched RPC messages
> could block the queue if they were too short. While a misconstructed RPC
> message is a problem, it is not a fatal queue error as long as the
> transport framing and checksum are valid.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

[...]

> -    /// Receive a message from the GSP.
> +    /// Wait for the next element on the message queue, pass it to `f`, =
advance the read pointer
> +    /// past the message, and returns the result of `f`.
>      ///
> -    /// A message whose function code is `M::FUNCTION` is decoded and re=
turned. Any other message
> -    /// is logged as an event.
> -    ///
> -    /// The read pointer is always advanced past the message, regardless=
 of whether it matched.
> +    /// The read pointer advances regardless of whether `f` succeeds or =
not.
>      ///
>      /// # Errors
>      ///
>      /// - `ETIMEDOUT` if `timeout` has elapsed before any message become=
s available.
> -    /// - `EIO` if a message fails framing or checksum validation.
> -    /// - `ENOMSG` if the message was not the awaited reply.
> +    /// - `EIO` if a message fails framing or checksum validation. In th=
is case, the read pointer
> +    ///   does not advance and the queue is stalled. This is a fatal err=
or.
>      ///
> -    /// Error codes returned by [`MessageFromGsp::read`] are propagated =
as-is.
> -    fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Resu=
lt<M>
> -    where
> -        // This allows all error types, including `Infallible`, to be us=
ed for `M::InitError`.
> -        Error: From<M::InitError>,
> -    {
> +    /// If an error is returned, then `f` has not been called.

optional nit: Clarify in a comment that w.r.t. `EIO` and `f` not being
called, that only applies for the outermost Err. i.e., we do have
R =3D Result<>, so we have Result<Result<>> but we're only talking about
the outer (transport) Result here. Maybe one way to clarify this is
that `R` contains the output of the message layer and may itself
be a Result<>, and this function returns a Result for the transport
layer. Not sure of the best way to phrase it but you know what I mean.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
