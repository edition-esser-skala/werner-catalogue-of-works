\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    f4-\solo a f2
    g f4 fis
    g fis d2
    e~ e8 d e4
    f! d e e
    d2 c~
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    a2-\solo a
    e'4. cis8 a h c4
    b a b2
    a a4 a~
    a h cis c
    c b2 a4
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d4.^\solo e8 f4 f8 g16[ a]
    cis,4 cis16[ d] e8 e[ d] d4
    r a' a8[ d,] g4
    r g f8[ a,] a4
    d gis a a~
    a g g f
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta,
  pec -- ca -- ta,
  pec -- ca -- ta
  mun -- _ di: Mi --
  se -- re -- re,
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    d4.-\solo cis8 d2
    d2. d4
    d2 g
    cis, d4 c
    b h a a'
    fis g e f
  }
}

BassFigures = \figuremode {
  r1
  <9 7\\ 4 2>2 <9>8 <8> <8 _+> <7 \t>
  <6 4>4 <5 _+> <9> <8>
  <10 6 5>2 <9>8 <8> <6>4
  <7> <6\\> <_+> <_!>
  <6 5>2 q
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "trb"
        \new Staff {
          \set Staff.instrumentName = "1"
          \TromboneI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \TromboneII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics
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
