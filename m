Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F23236B918
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 03:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702339; cv=fail; b=kI819Xr6DJHn8CJbXt2dosxy8q8m6aMNXWaBBq8KhnXzSWkiRIWjhuHKPfEHKJZkfvzWMrG2494yVML/M+dSVxwct+sfHObO4spxxv2WXKJeFdxDMejp+4j+XGN3HdMe5JiJ3vOQMDUoPup916VQwZQB52l4b34y1RjcQjmXAmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702339; c=relaxed/simple;
	bh=rLnjfwC1kv7+elrg1az6Ec7b1uOLgWVbvMcDSLMVZ+s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FMGPUJ9flNlHpxiiVXH+H/L7JfAm4ZZPVFIIz07ETSnt1ZzWlN9GkTwmQ5UuLy2a2kF+72yqX5tLgpVA29YMwDHB8LAw/w1UTIFEmK78GXrt/dmXv7Yi6x6j6Lcgr/v0iRPWJBdh4G9k2GtpWw4/XT9Oka2bMBtPgVhxncu+j24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dGz88ibC; arc=fail smtp.client-ip=52.101.46.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dGz88ibC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIqVqMYe6/ZSdkzLeiUc9PHPsHCyeNZ4hklFry4p3Kfu+JuMfq6yIqVFxXcweOKZkXQvL4FS/YDaElMhIkQl5TlOugxpIVakYlg1ZPoeSrF6qJao4LFHtr5Dy75cwUtgjx3IZjXLZmFBsEDqFWT0AYW/RLnDLwejjXeQ5HzUA5DX895q6BO/BztxhX0epoPAVPLYdVeM3Y82K1VJtYwVPGqV11+t83D4tsAicFTsnociVhjaEDiej93Cvy0Q/2KpMBLDB2PTDcQnlH7GBFKjVs05AaA3kJC/kQ3Wa/5fwrXvGh6acGw0jW5qEogyhYMCQHcJjuW/fTgcELbwim/W4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLnjfwC1kv7+elrg1az6Ec7b1uOLgWVbvMcDSLMVZ+s=;
 b=tm1sRIHpxLWy6eb3NHBSnmlnTHBgX+gTze+rizDpqhAR0NQXHgUiHV43KvDkxkX9qpupFuiKe0EXIxogocpuCE3jUA0W0ygYitIQqbwJx5DbxDnacUEKKel3DnCDifhM7YZT8ZkqUPZZO8eQbW5LnUmu/1B6WN5GtSmInNYM6WE80XKILdP+jfz6EutBuS+eY1Y2pA9RQtlGkVdUj+edts4qBCipENUXlg/MP1JknjS3gL87dGfAQaLV5qka8jceTOzFpHd3LzD5e0tve48p+5pQts9Jhd2FBXZeuVbToiV2EJR0v8P4r73AzsbwsvlPdMxVfB3oOGsk6Lazo0PRxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLnjfwC1kv7+elrg1az6Ec7b1uOLgWVbvMcDSLMVZ+s=;
 b=dGz88ibC8+1BGHyOPh6x+dlySoCS+IgmFGL2KwTNkVpG4GPRr+FztuMKACQayU+jsDrz1afz2VPqrowncdjsiEecTlebI7CEHutylj+5x+H8cwxhi1FAcqrMVd/POJXAqwHY0sSSTmZjcT8ity8CHYHpoBaiMQLFi8HZ2I2LH/ut2DleTVYyZsC1yCedf0q6xTuS7Z1aQl0VLpK1ZrwQ2Y9eZVU0T6PfUjt/IcSpw740z97dVUTtnXJS8tdi9nw5f80IopvFh5F7veEeltpaO+8q7mFB2rwyq94EYP5/iB5Dp4axt2/Xo3+gOWjtf8uGe6eVQRlM6PZTn9CmTUgfkA==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by DS7PR12MB8290.namprd12.prod.outlook.com (2603:10b6:8:d8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 03:32:10 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 03:32:09 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "lossin@kernel.org" <lossin@kernel.org>, "a.hindborg@kernel.org"
	<a.hindborg@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi
 Wang <zhiw@nvidia.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"tmgross@umich.edu" <tmgross@umich.edu>, "alex.gaynor@gmail.com"
	<alex.gaynor@gmail.com>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Eliot Courtney
	<ecourtney@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple
	<apopple@nvidia.com>
Subject: Re: [PATCH v3 17/33] gpu: nova-core: add the r000 load-and-execute
 bootloader handler
Thread-Topic: [PATCH v3 17/33] gpu: nova-core: add the r000 load-and-execute
 bootloader handler
Thread-Index: AQHdRwohaEstYFURukmsJ1v3VczR7rbTrnwA
Date: Fri, 18 Sep 2026 03:32:09 +0000
Message-ID: <6086c0a0e05afdcf1d81dc822e4ad0de54e75c70.camel@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
	 <20260918010719.1176945-18-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-18-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|DS7PR12MB8290:EE_
x-ms-office365-filtering-correlation-id: 3b4cf18f-f4de-4415-cff1-08df15356bef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|10070799003|38070700021|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 /+k2quhat+bM0iVMbzv8UdZnBRdYCvaaRv2HSL7Lq9N5sOG4Jl2wblT377IVahxtICIxRtSlEekLbDBN//vpRlzaLw68XFL0eXDEDQlVoF/p1QboAhqoLhidldVrceEJhqwBuwr5AilhxV99Lt/i4gum7N1dsXNGLfgF5OErkVrTzkE4VYfob3H7TgHy5k/Sng34PflcmRR81VBrH+xPptyogmJ8Mo0C0AOrvIIRR2PFFTgOyp5Q+4fNL/Wc7cQ+C9S3xT6O+F99/OC2LtYXW/ihvZQGJnXOBeHDDttXt/Vlo33Nq32fEl1/l5e4+kx6DyiJFOtOVlrKH1TTpeqaYbqwgb6p/vHFAmmYRBkspR3m8j/P/eAQDLflUXT1iQZ1P/C2N/XZKQHTkE4SADFbzT/8jvCjW9FIFa5nM01rHx/mjFckE9JVxg82kxgDICgWoBY8RV9kjCi46BjAd4sb8fPbi17eLZ0VAHczHZOzfg8xfqbji3ogyPU22fOVQxpDW4nft9kDNj5IfiYvLvSWRUL/2zni2HuRL6D+vEeOhc0YmeKxgSMwIUBYzFAw21ydrKeprrUG7LFVzCi/0C1GuimWrVRKsvB1gjmSWQbxVlED0Qlssbw1AVHPZgc0DQ6pDdLvt2tlqS44WgExaAWYBzWPYtGMmxQacipi7ChQOsKo5YhTzOEOuIJETVhsFD6QGKNiy3f8K4Q4nynktzGn82tJJLXOr6wV6N2hFb3B00M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(10070799003)(38070700021)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZjUzMlJRRWR3bEozS0pXaHFFcFlDUEx1QytpTjBSSWptNm01YVRzcGMwRkg4?=
 =?utf-8?B?Znh2VE5sdVQ5ZHdqZU54SzVVZGdZdHQvVHdyOWZ3aFBXcXI1eEtSSzZ6TWQ2?=
 =?utf-8?B?MHVyaXpoa1RHVVVMVW0xQ1NFdUV6Nk02Ym1QNXE1NytUb3ZuVlVrRmtlN1kw?=
 =?utf-8?B?bFlWNGRwcmt3WmlQN0hoL0V3RDlpU0ZrQjlQYXdYTmtDU0tER0Z1ZFZqZGQx?=
 =?utf-8?B?M01FdHlBN013U1F2QVUwR2dvLzFEUFE2Q1gvV1NsdUlkMmZ6KytaWVVhK1dy?=
 =?utf-8?B?WTFHMHdiVTJ2azNaQ3lsMEZ0WXk3a05rdStUK3pNTVEwdGtTaWdyWHdjcVQ2?=
 =?utf-8?B?Ukt0OWNZV29xNzF6QjBUZDFmWm8rMDdjUkhHemdZbk5pd1QzMmc2VXNIWVZ3?=
 =?utf-8?B?TG1uR21BaTA5VXIrRGF1QU5qUGprZzNrVXRPK3lVSiswWENMQXRBMUwzbkdU?=
 =?utf-8?B?WVVjU0xwSFhYVmQ4SlBOTHRFcFhGRUd5VmZIT09Uc1BXeG9qSTFmeWwyZ1RJ?=
 =?utf-8?B?bUJnTmgwNHcreGpROW53SG4zNFhUeWdMZ1lLQ3p3bFlwaUZSQ0ZyVmROZWUw?=
 =?utf-8?B?dys5Skw0V095UzQ3UnVMT0FnUGlhYUl0VllXdWplaFRSdk1qZVFDWVYzOUxV?=
 =?utf-8?B?RTFtYTFxMHJxMUF2aEhiYWVCb25MYmtIR0NVZXNacDhFS1pkM2JodUFtRCtI?=
 =?utf-8?B?NUsyeGJNQ0pQazRUVTJJN0VYMXRpKzEyVjdERXBINEhSWWt1MnlWUlpmWmFQ?=
 =?utf-8?B?ZUlEcEVCT3JGTS9ldU5QY0h0UmxOSFg1M1k4czk3dG94c1I2eCswMGJNRzNw?=
 =?utf-8?B?YnJGRGJwa3Q3aWdCaC9ZTXkyZkZNYWhKZGMzUDd0MXh1MkJ1R3hkbVo1THZQ?=
 =?utf-8?B?a0ZUc1hLWFpnOUdvQmNOU3NxWlhuOHFKd1J4am51Tk1ERnlPNUJPQnFUalBQ?=
 =?utf-8?B?UlE2NW8xcGdjbmFScmhrbmZrL3M4TnVKWWg0a3dsRTRMaXh4ZTJ2L3ZBeUgx?=
 =?utf-8?B?VnA5c3lJZ3dFV255dG8xTWFITTdVbGVyQ2JZbm5PZWs4ZFhHcjNnNDV3aUww?=
 =?utf-8?B?L0gyY3V6dFNYbE1VSnJVR1RlTklicnB6ODM4M1VyVmRuWGpkMWtwSXZNSkFn?=
 =?utf-8?B?WktZQWRoRXVsVmExWDAxQS9OK20zRm42T3FjQXZycEQxRy9BMUdoZjVsWXJJ?=
 =?utf-8?B?WGl3aFFYNktCYUdMOVNEUG9RMkNNWmM5REV1T0RYRjJxMHZVb0lhTFVhZTdK?=
 =?utf-8?B?bGpITVE1Q1FibjZtM24ralpwOVN3U3R2eWRheFJhNE9vdThNTlEzdXhuSkVO?=
 =?utf-8?B?TU1TZnFSUWE0YUdFUGxnYUc0WG9VMXZGZEFhMUd1YXFkVjRxckFGWE1pUTJM?=
 =?utf-8?B?UklxUGliRkk2NzNRbVZGdXhXT3M1MXc5bC80dHRxeW1UdDA0bi8rYml4SHBv?=
 =?utf-8?B?NEhjOVpvZTlJN3dRY0JaWFVVcmtzZWJoZGs1NEhrZGRsd1JaK01NWUNRdlYv?=
 =?utf-8?B?RzNIdzYwZEltYmFQSjV6TFo1VjNPT1hHdmZwSjAzaE1za090Vkxqakh4Yldz?=
 =?utf-8?B?clp2c3YyQnp0RkU5aEhVZWUzRkk3S3lMZDNDQy9vemVZWmVtVVFLRlNjWEw2?=
 =?utf-8?B?R1hqYzRIeHFQSGhQRUlNTDhiU1BuRHh5Mm1VbnMzYzlneUdDK0tCeHlLQ1Jx?=
 =?utf-8?B?b2lzQU9xVGtLalBMalpGMDh5eGNCa2I3WGdGbWMzOGZIZ0ZiY09JdWpkWWk3?=
 =?utf-8?B?SFlVa1Vmd1J0UmF5V1VVUEw1WXVxQ1ZjME5nSjM3Y24zT3ZtQmRSTllnOWtm?=
 =?utf-8?B?YjFsQWZxM3dJTEt4TnFRSXMvbEZEREZPUVA1RjRFbDNwb1dmODVNOVkvbWtB?=
 =?utf-8?B?SjhWMkNNZDhnbWdVTmpWNm5VOWtGVDZkNkdvbVlvSjBZS0d2Y1JOR25sWDF2?=
 =?utf-8?B?Ykh5Um81K25LTWN6dHZsMi9nUVFLZXhyYzhqVmdPTFY0eENqWnFIS0lFcWZh?=
 =?utf-8?B?b0lzdWVBWDBaaGRiSzFLYzZpVzFUa3BuZm5FbFh5N3Y2M214WTNmbVRpZlYv?=
 =?utf-8?B?ampkSlVvNXg1bHh6N3FvZ1VsYVFQcU0rbzJVdWE1enFHMk9Zb3phd1JYeGZO?=
 =?utf-8?B?bUVVMUJ3aGh3MGEzL3RISTRRVnVHSFBqZmJyZXlUQTRUR1RUdTRmVGRZWFJW?=
 =?utf-8?B?WUhndmJrcTl1b2oyQWhwTFEwaDhWQWZjWHNwbW4wT2JQZisrbUtTNEFWSmlI?=
 =?utf-8?B?TXZ6a0tvNW5pclR2ajh1QUt5M1NDRUgybnVNYzc3NnIreTBvdlZsUFRDMW85?=
 =?utf-8?B?bFlkTVlXZ25mc2oxR1hvMUgyM1lCQXpiTEZxUWxRbkNGcDlhOWxBSEw1akRE?=
 =?utf-8?Q?EwleJOxEajxXVfHWPnDAo84wqUjjnsa5gW2CWhDuUeRuG?=
x-ms-exchange-antispam-messagedata-1: xanataaF+fVBKg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <BBD542A69ED87244BA24D23C1FDFC314@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN6PR12MB8568.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4cf18f-f4de-4415-cff1-08df15356bef
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 03:32:09.8030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j5k9nxEq7o137cVK/GC7dqHfZ3Ur0odrpjN5/zm1G1VPU7FEIcvR9rEBUVaUakg83OX1Hv7DBkEg2upDRjR6og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8290

T24gVGh1LCAyMDI2LTA5LTE3IGF0IDE4OjA3IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IEBAIC0xMzMsNiArMTQxLDc1IEBAIGZuIGNvcmVfcmVzdW1lKCZzZWxmKSAtPiBSZXN1bHQgew0K
PiDCoMKgwqDCoMKgwqDCoMKgIE9rKCgpKQ0KPiDCoMKgwqDCoCB9DQo+IMKgDQo+ICvCoMKgwqAg
Ly8vIFJ1bnMgdGhlIGdlbmVyaWMgYm9vdGxvYWRlciBvbiB0aGUgR1NQIGZhbGNvbiwgYXMgYQ0K
PiBgR01DQVBJX0NNRF9FWEVDX0dFTkVSSUNfQk9PVExPQURFUmANCj4gK8KgwqDCoCAvLy8gZXZl
bnQgcmVxdWVzdHMsIGFuZCB0aGVuIHJlc3RhcnRzIEdTUC1STS4NCj4gK8KgwqDCoCAvLy8NCj4g
K8KgwqDCoCAvLy8gVGhlIGRlc2NyaXB0b3IgdGhhdCB0aGUgZXZlbnQgY2FycmllcyBuYW1lcyB0
aGUgaW1hZ2UgdGhhdCB0aGUgYm9vdGxvYWRlciBsb2Fkcy4NCj4gK8KgwqDCoCAvLy8NCj4gK8Kg
wqDCoCAvLy8gIyBFcnJvcnMNCj4gK8KgwqDCoCAvLy8NCj4gK8KgwqDCoCAvLy8gLSBgRUlOVkFM
YCBpZiB0aGlzIGNoaXBzZXQgYm9vdHMgd2l0aG91dCB0aGUgZ2VuZXJpYyBib290bG9hZGVyLCBp
ZiB0aGUgcGF5bG9hZCBpcw0KPiBzaG9ydGVyDQo+ICvCoMKgwqAgLy8vwqDCoCB0aGFuIHRoZSBw
YXJhbWV0ZXIgYmxvY2ssIGlmIHRoZSBkZXNjcmlwdG9yIGlzIG5vdCB0aGUgc2l6ZSB0aGF0IHRo
aXMgZHJpdmVyDQo+IGRlZmluZXMgZm9yDQo+ICvCoMKgwqAgLy8vwqDCoCBpdCwgb3IgaWYgdGhl
IGV2ZW50IG5hbWVzIGEgY29udGV4dCBETUEgc2xvdCBvciBhbiBhcGVydHVyZSB0aGF0IGRvZXMg
bm90IGV4aXN0Lg0KPiArwqDCoMKgIC8vLyAtIGBFVElNRURPVVRgIGlmIHRoZSBSSVNDLVYgY29y
ZSBkb2VzIG5vdCBzdXNwZW5kIHdpdGhpbiB0d28gc2Vjb25kcywgb3IgdGhlIEdTUA0KPiBmYWxj
b24gZG9lcw0KPiArwqDCoMKgIC8vL8KgwqAgbm90IGhhbHQgd2l0aGluIHR3byBzZWNvbmRzIG9m
IHN0YXJ0aW5nIHRoZSBpbWFnZS4NCj4gK8KgwqDCoCAvLy8NCj4gK8KgwqDCoCAvLy8gRXJyb3Jz
IGZyb20gW2BTZWxmOjpjb3JlX3Jlc3VtZWBdIGFyZSBwcm9wYWdhdGVkIGFzLWlzLg0KPiArwqDC
oMKgICNbZXhwZWN0KGRlYWRfY29kZSldDQo+ICvCoMKgwqAgZm4gaGFuZGxlX2xvYWRfZXhlY19i
b290bG9hZGVyKCZzZWxmLCBwYXlsb2FkXzA6ICZbdThdLCBwYXlsb2FkXzE6ICZbdThdKSAtPiBS
ZXN1bHQgew0KPiArwqDCoMKgwqDCoMKgwqAgbGV0IFNlbGYgew0KPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBnc3BfZmFsY29uLCBkZXYsIC4uDQo+ICvCoMKgwqDCoMKgwqDCoCB9ID0gKnNlbGY7
DQoNCldoeSBkbyB5b3UgY3JlYXRlIGxvY2FsIHZhcmlhYmxlcyBvZiB0d28gbWVtYmVyIG9mIExv
YWRFeGVjQ29udGV4dD8gIEJ5IGRvaW5nIHRoaXM6DQoNCiAgICAgICAgbGV0IFNlbGYgew0KICAg
ICAgICAgICAgZ3NwX2ZhbGNvbiwgZGV2LCAuLg0KICAgICAgICB9ID0gKnNlbGY7DQoNCnlvdSBm
b3JjZSBldmVyeSBtZW1iZXIgb2YgTG9hZEV4ZWNDb250ZXh0IHRvIGltcGxlbWVudCBDb3B5LCBl
dmVuIHRoZSBvbmVzIHlvdSBhcmUgbm90IGNvcHlpbmcNCmhlcmUuDQoNCj4gKyAgICAgICAgaWYg
cGFyYW1zLmRtZW1fZGVzY19zaXplICE9IEJvb3Rsb2FkZXJEbWVtRGVzY1YyOjpTSVpFIHsNCj4g
KyAgICAgICAgICAgIGRldl9lcnIhKA0KPiArICAgICAgICAgICAgICAgIGRldiwNCj4gKyAgICAg
ICAgICAgICAgICAiTG9hZC1leGVjIGRlc2NyaXB0b3IgaXMge30gYnl0ZXMsIGV4cGVjdGVkIHt9
XG4iLA0KPiArICAgICAgICAgICAgICAgIHBhcmFtcy5kbWVtX2Rlc2Nfc2l6ZSwNCj4gKyAgICAg
ICAgICAgICAgICBCb290bG9hZGVyRG1lbURlc2NWMjo6U0laRQ0KPiArICAgICAgICAgICAgKTsN
Cg0KU28gaGVyZSwgd2h5IG5vdCBqdXN0IGRvIHNlbGYuZGV2Pw0K
