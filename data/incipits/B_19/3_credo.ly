\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Vivace"
    a'4 b r8 a g b
    a g4 f8 e a f16 d f g
    a8 d, r4 r2
    r r4 b'8 c
    d g c, f4 e8 d c~
    c d g, a b! r a d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Vivace"
    r4 d f8. f16 e8 d
    cis e d4. cis8 d4
    R1
    r4 r8 g c, d16 e f4~
    f8 e f8. f16 g8 a b4
    a r d,8 e f g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    a'4^\tutti b r8 a g b
    a g4 f8 e a f16[ d f g]
    a8 d, r4 r2
    r r4 b'8 c
    d g c, f4 e8 d c
    c[ d] g, a b! r a d
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem coe --
  _ li
  vi -- si --
  bi -- li -- um, vi -- si -- bi -- li --
  um o -- mni -- um, o -- "mni -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r4 d^\tutti f e8[ d]
    cis e d4. cis8 d4
    R1
    r4 r8 g c, d16[ e] f4~
    f8[ e] f4 g8 a b8. b16
    a4 r d,8 e f g
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten -- _ tem,

  fa -- cto -- rem coe --
  li vi -- si -- bi -- li --
  um, vi -- si -- bi -- "li -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1
    r2 a4^\tutti b
    r8 a g c! b4 a8 d
    c4 b a8.[ b32 c] d8 c
    b4\trill a r2
    a8 h c8. c16 b?8[ cis] d d,
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem %2
  o -- mni -- po -- ten -- tem, fa --
  cto -- rem coe -- li et
  ter -- rae,
  vi -- si -- bi -- li -- um o -- "mni -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1
    r2 r4 d^\tutti
    f r8 e d g f4
    e8 a d, e f16[ e d c] b8 a
    g4 f r d'8 e
    f8. f16 e8[ fis] g[ e] d[ b]
  }
}

BassoLyrics = \lyricmode {
  Pa --
  trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe -- li et
  ter -- rae, vi -- si --
  bi -- li -- um o -- "mni -"
}

Organo = {
  \relative c {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "Vivace"
    << {
      a''4 b r8 a g b
      a g4 f8
    } \\ {
      r4-\tutti d f e8 d
      cis e d4
    } >> \clef tenor a \clef bass d,
    << {
      r8 a' g c b4 a8 d
      c4 b
    } \\ {
      f4 r8 e d g f4
      e8 a d, e
    } >> f16 e d c b8 a
    g4 f8 \clef soprano << { f'''~ f[ e] } \\ { f, g[ a] } >> \clef bass d,, e
    f4 e8 fis g e d b
  }
}

BassFigures = \figuremode {
  r1
  r2 <5 4>8 <\t _+> <6->4
  <3>1
  r4. <10>8 <5 3>2
  <7>8 <6> r2 <8 6>8 <6 5>
  <5 3> <6 4!> <6>4 <_->8 <6\\> r <6>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "b"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
